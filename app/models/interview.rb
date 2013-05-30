class Interview < ActiveRecord::Base
  attr_accessible :applicant_id, :user_id, :interview_at, :notes

  belongs_to :user
  belongs_to :applicant
end
