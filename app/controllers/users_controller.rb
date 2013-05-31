class UsersController < ApplicationController
  before_filter :find_user, :only => [:update, :destroy]

  def update
    @user.update_attributes(params[:user])
    flash[:notice] = "User has been made Instructor."
    redirect_to dashboard_users_path
  end

  def destroy
    @user.destroy
    flash[:notice] = "User has been deleted."
  end

private
  def find_user
    @user = User.find(params[:id])
  end
end
