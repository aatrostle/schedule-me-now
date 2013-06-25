FactoryGirl.define do
  factory :user do
    email "applicant@email.com"
    password "password"
    password_confirmation "password"

    factory :instructor_user do
      after_create { |user| user.update_attribute(:instructor, true) }
    end

  end
end
