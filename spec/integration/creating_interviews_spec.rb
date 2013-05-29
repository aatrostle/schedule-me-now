require 'spec_helper'

feature 'Creating Interviews' do
  before do
    # sign in as admin
    visit '/'
    click_link 'New Interview'
  end

  scenario "can create interview" do
    fill_in 'Intervew At', :with => "datetime"
    fill_in 'Applicant', :with => "applicant"
    fill_in 'Instructor', :with => "instructor"
    click_button 'Create Interview'
    page.should have_content('Interview has been created.')
  end

  scenario "can not create an interview without a time" do
    click_button 'Create Interview'
    page.should have_content('Interview has not been created.')
    page.should have_content('Time can not be blank.')
  end
end
