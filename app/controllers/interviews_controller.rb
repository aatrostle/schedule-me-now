class InterviewsController < ApplicationController
  before_filter :authorize_instructor!, :only => [:create]
  before_filter :find_interview, :only => [:update]

  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(params[:interview])
    if @interview.interview_at < Time.now
      flash[:alert] = "Interview cannot be scheduled for the past"
      render :action => "new"
    elsif @interview.save
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
    if current_user.instructor?
      @interview.update_attributes(params[:interview])
      flash[:notice] = "Interview has been updated."
      redirect_to interviews_path
    else
      if current_user.id == @interview.applicant_id
        @interview.update_attribute(:applicant_id, nil)
      elsif @interview.applicant_id == nil
        begin
          @interview.update_attribute(:applicant_id, current_user.id)
        rescue
          ActiveRecord::RecordNotUnique
        end
      end
      redirect_to reservations_path
    end
  end

private
  def find_interview
    @interview = Interview.find(params[:id])
  end

end
