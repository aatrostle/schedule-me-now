class DashboardController < ApplicationController
  before_filter :authorize_instructor!

  def index
    @interviews = Interview.order("interview_at").all
  end

  def users
    @users = User.where("instructor = false").all
  end

end
