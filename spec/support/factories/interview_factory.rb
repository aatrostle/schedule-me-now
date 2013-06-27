FactoryGirl.define do
  factory :interview do
    sequence(:instructor_id) { |n| n }
    interview_at "2013-06-28 18:30:00"
  end
end
