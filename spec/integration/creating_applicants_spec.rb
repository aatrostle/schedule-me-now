require 'spec_helper'

feature "Creating Applicants" do
  before do
    visit '/'
    click_link 'Applicants'
    click_link 'Add Applicant'
  end

  scenario "can create an applicant" do
    fill_in 'Name', :with => "John Doe"
    fill_in 'Email', :with => "johndoe@email.com"
    click_button "Create Applicant"
    page.should have_content("Applicant has been created.")
  end

  scenario "can not create an applicant without a name" do
    click_button "Create Applicant"
    page.should have_content("Applicant has not been created.")
    page.should have_content("Name can't be blank")
  end
end
