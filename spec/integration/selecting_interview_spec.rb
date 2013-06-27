require 'spec_helper'

feature "Selecting interview" do
  before do
    Factory(:interview)
    sign_in_as!(Factory(:user))
    visit '/'
    click_link
  end

  scenario "Selecting an unreserved time" do
    click_button "Reserve 9:30 AM"
  end

  scenario "Release your time before selecting another" do
    Factory(:interview)
  end

end
