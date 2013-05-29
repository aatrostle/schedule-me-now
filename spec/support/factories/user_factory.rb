FactoryGirl.define do

  factory :user do
    password "password"
    password_confirmation "password"

    factory :confirmed_user do
      sequence(:email) { |n| "user#{n}@codefellows.org" }
      after_create do |user|
        user.confirm!
      end
    end

    factory :instructor_user do
      sequence(:email) { |n| "instructor#{n}@codefellows.org" }
      after_create do |user|
        user.confirm!
        user.update_attribute(:instructor, true)
      end
    end
  end
end
