require 'spec_helper'

feature do
  let!(:instructor) { Factory(:instructor_user) }

  before do
    sign_in_as!(instructor)
    click_link "Interviews"
  end

  scenario "Adding a time" do
    fill_in "Date", :with => "06/02/2013"
    fill_in "Start Time", :with=> "9:00 AM"
    fill_in "End Time", :with => "12:00 PM"
    fill_in "Interview Length", :with => "30"

    page.should have_content("6 slots")
  end
end
