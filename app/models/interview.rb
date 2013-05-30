class Interview < ActiveRecord::Base
  attr_accessible :applicant_id, :instructor_id, :interview_at, :notes

  # NEED TO FIX VALIDATION - DOESNT WORK
  validates :applicant_id, :uniqueness => true, :on => :save

  belongs_to :user

  def state(u_id)
    if u_id == self.applicant_id
      :owned
    elsif self.applicant_id
      :reserved
    else
      :open
    end
  end
end
