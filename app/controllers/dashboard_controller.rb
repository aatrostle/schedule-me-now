class DashboardController < ApplicationController
  before_filter :authorize_instructor!
  before_filter :list_applicants, :only => [:index, :users]

  def index
    @interviews = Interview.order("interview_at").where("applicant_id IS NOT NULL").all
  end

  def users
    @list_instructors = User.where("instructor = true")
  end

  def interviews
    @interview = Interview.new
    @list_interviews = Interview.where(:instructor_id => current_user.id).order("interview_at").all
  end

  private
    def list_applicants
      @list_applicants = User.where("instructor = false")
    end
end
