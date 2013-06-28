require 'spec_helper'

feature 'Disable instructor privileges' do
  before do
    Factory(:instructor_user)
    visit '/'
    sign_in_as!(Factory(:instructor_user))
    click_link 'Users'
  end

  scenario 'Successful update instructor to applicant' do
    within_table("instructors") do
      uncheck("user_instructor")
      click_button 'Make Applicant'
    end
    page.should have_content('User has been made Applicant.')
  end

end
