module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password"
    click_button 'Sign in'
    # if user == :instructor_user
    #   page.should have_content("Dashboard")
    # else
    #   page.should have_content("Reserve your spot today!")
    # end
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, :type => :request
end
