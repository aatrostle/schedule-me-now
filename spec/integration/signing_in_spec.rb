require 'spec_helper'

feature 'Signing in' do
  before do
    Factory(:user, :email => "applicant@email.com")
    Factory(:instructor_user, :email => "instructor@codefellows.org")
  end

  context "as an applicant user" do
    scenario 'Signing in via form' do
      visit '/'
      fill_in 'Email', :with => "applicant@email.com"
      fill_in 'Password', :with => "password"
      click_button "Sign in"
      page.should have_content("Reserve your spot today!")
    end
  end

  context "as an instructor user" do
    scenario 'Signing in via form' do
      visit '/'
      fill_in 'Email', :with => "instructor@codefellows.org"
      fill_in 'Password', :with => "password"
      click_button "Sign in"
      page.should have_content("Dashboard")
    end
  end

end
