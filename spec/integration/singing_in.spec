require 'spec_helper'

feature 'Signing in' do
  before do
    Factory(:user, :email => "instructor@codefellows.org")
  end

  scenario 'Signing in via form' do
    User.find_by_email('instructor@codefellows.org').confirm!
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "instructor@codefellows.org"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    page.should have_content("Today's Interviews")
  end

end
