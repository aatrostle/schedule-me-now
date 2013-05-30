require 'spec_helper'

feature 'Enable instructor privileges' do
  before do
    sign_in_as!(Factory(:instructor_user,
                        :email => "instructor@codefellows.org"))
  end

  scenario 'Successful update applicant to instructor' do
    page.should have_content("Dashboard")

  end

end
