require 'spec_helper'

feature "Selecting interview" do
  before do
    sign_in_as!( Factory(:confirmed_user))
    Factory(:interview, :start_time => "9:30 AM")
  end

  scenario "Selecting an unreserved time" do
    click_button "Reserve 9:30 AM"
  end

end
