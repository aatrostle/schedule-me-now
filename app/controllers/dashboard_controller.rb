class DashboardController < ApplicationController
  before_filter :authorize_instructor!

  def index
    @interviews = Interview.order("interview_at").all
  end

  def users
    # @user = User.find(params[:id])
    @list_applicants = User.where("instructor = false")
    @list_instructors = User.where("instructor = true")
  end

  def interviews
    @interview = Interview.new
    @list_interviews = Interview.order("interview_at").all
  end

end
