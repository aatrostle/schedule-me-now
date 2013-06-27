FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com"}
    password "password"
    password_confirmation "password"

    factory :instructor_user do
      after_create { |user| user.update_attribute(:instructor, true) }
    end

  end
end
