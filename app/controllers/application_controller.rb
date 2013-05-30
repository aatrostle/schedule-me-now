class ApplicationController < ActionController::Base
  protect_from_forgery

private
  def authorize_instructor!
    authenticate_user!
    unless current_user.instructor?
      flash[:alert] = "You must be an instructor to do that."
      redirect_to root_path
    end
  end
end
