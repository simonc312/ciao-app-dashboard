# Feature: Sign in
#   As a admin
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do

  # Scenario: Admin signs in with good credentials
  #   Given I am a valid Admin
  #   When I sign in with valid credentials
  #   Then I see an valid admin credentials message
  scenario 'admin signs in successfully should see admin dashboard' do
  	admin = FactoryGirl.create(:user,:admin_role)
    signin(admin.email, admin.password)
    expect(page).to have_content 'Add New Partner'
    expect(page).to have_content 'Manage Partners'
    expect(page).to have_content 'Dashboard Reports'
  end

end