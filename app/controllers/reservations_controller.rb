class ReservationsController < ApplicationController
  before_filter :authorize_applicant!

  def index
    interviews = Interview.all
    @interviews = []
    interviews.each do |i|
      @interviews << {:state => i.state(current_user.id),
                      :interview => i}
    end
  end

end
