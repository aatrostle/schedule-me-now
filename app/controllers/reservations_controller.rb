class ReservationsController < ApplicationController
  before_filter :authorize_applicant!


  def index
    interviews = Interview.where("interview_at > ?", DateTime.now).order("interview_at","instructor_id")
    @interviews = []
    interviews.each do |i|
      @interviews << {:state => i.state(current_user.id),
                      :interview => i}
      unless i.applicant_id.nil?
        if i.applicant_id == current_user.id && i.interview_at.to_date == DateTime.now.to_date
          redirect_to '/my-reservation'
        end
      end
    end
  end

  def show
    @interview = Interview.where("applicant_id = ?", current_user.id).first
  end

end
