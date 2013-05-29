require 'spec_helper'

feature "Viewing applicants" do
  let(!user) { Factory(:instructor_user) }
  let(!applicant)) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit "/applicants"
  end

  scenario "List all applicants" do
    page.should have_content(applicant.email)
  end
end
