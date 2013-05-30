class DashboardController < ApplicationController
  before_filter :authorize_instructor!

  def index
    @interviews = Interview.all
  end

end
