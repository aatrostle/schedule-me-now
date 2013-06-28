require 'spec_helper'

feature "Selecting interview" do
  before do
    Factory(:interview)
    sign_in_as!(Factory(:user))
    visit '/'
  end

  scenario "Selecting an unreserved time" do
    within("#1") do
      click_button "Reserve"
    end
    within("#1") do
      find_button("Release")
    end
  end

  # scenario "Release your time before selecting another" do
  #   Factory(:interview, :applicant_id => "2")
  #   within("#2") do
  #     click_button "Release"
  #   end
  #   within("#2") do
  #     find_button("Reserve")
  #   end
  # end

end
