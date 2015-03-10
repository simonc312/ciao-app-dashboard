# Feature: Sign in
#   As a partner
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do

  # Scenario: Partner signs in with good credentials
  #   Given I am a valid partner
  #   When I sign in with valid credentials
  #   Then I see an valid partner credentials message
  scenario 'partner signs in successfully should see partner dashboard' do
  	partner = FactoryGirl.create(:user,:partner_role)
    signin(partner.email, partner.password)
    expect(page).to have_content 'Manage Customers'
    expect(page).to have_content 'Dashboard Reports'
  end

end