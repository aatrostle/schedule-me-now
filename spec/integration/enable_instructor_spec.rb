require 'spec_helper'

feature 'Enable instructor privileges' do
  before do
    Factory(:user)
    visit '/'
    sign_in_as!(Factory(:instructor_user))
    click_link 'Users'
  end

  scenario 'Successful update applicant to instructor' do
    check("user_instructor")
    click_button 'Make Instructor'
    page.should have_content('User has been made Instructor.')
  end

end
