FactoryGirl.define do
  factory :user do
    password "password"
    password_confirmation "password"

    factory :instructor_user do
      after_create do |user|
        user.update_attribute(:instructor, true)
      end
    end

  end
end
