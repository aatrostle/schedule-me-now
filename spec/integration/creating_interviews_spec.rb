require 'spec_helper'

feature 'Creating Interviews' do
  before do
    sign_in_as!(Factory(:instructor_user))
    visit '/'
    click_link 'Timeslots'
  end

  scenario "can create interview" do
    select_date_time('2014,July,4,12 PM,00', :from => 'Interview at')
    click_button 'Create Interview'
    page.should have_content('Interview has been created.')
  end

  # scenario "can not create an interview in the past" do
  #   select_date_time('2012,July,4,12 PM,00', :from => 'Interview at')
  #   click_button 'Create Interview'
  #   page.should have_content('Interview can not be scheduled for the past.')
  # end

  # scenario "can not create an interview without a time" do
  #   click_button 'Create Interview'
  #   page.should have_content('Interview has not been created.')
  # end
end
