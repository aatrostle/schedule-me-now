class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.instructor?
      dashboard_url
    else
      reservations_url
    end
  end

private
  def is_logged_in
    authenticate_user!
  end

  def authorize_instructor!
    authenticate_user!
    unless current_user.instructor?
      flash[:alert] = "You must be an instructor to do that."
      redirect_to reservations_url
    end
  end

  def authorize_applicant!
    authenticate_user!
    if current_user.instructor?
      flash[:alert] = "You don't need to see that, " +
                      "you're an instructor silly!"
      redirect_to root_path
    end
  end
end
