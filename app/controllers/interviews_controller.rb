class InterviewsController < ApplicationController
  # before_filter :authorize_instructor!

  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(params[:interview])
    if @interview.save
      flash[:notice] = "Interview has been created."
      redirect_to interviews_path
    else
      flash[:alert] = "Interview has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @interview.update_attributes(params[:interview])
      flash[:notice] = "Interview has been updated."
      redirect_to interviews_path
    else
      flash[:alert] = "Interview has not been updated."
      render :action => "edit"
    end
  end

end
