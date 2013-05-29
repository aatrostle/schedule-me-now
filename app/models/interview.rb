class Interview < ActiveRecord::Base
  attr_accessible :applicant_id, :instructor_id, :interview_at, :notes
end
