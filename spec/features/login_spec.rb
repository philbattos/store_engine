require 'spec_helper'

describe 'login page' do
  it "displays the login view" do
    visit '/'

    click_on "Login"

    expect(current_path).to eq login_path
  end

  context "when logging in with correct username and password" do
    it "redirects to homepage and displays a success message" do
      User.create(username: "josh", email: "josh@gmail.com", password: "testtesttest", first_name: "testuser", last_name: "testuser")

      visit login_path
      fill_in "Username", with: "josh"
      fill_in "Password", with: "testtesttest"
      click_button "Login"
      sleep 5
      expect(current_path).to eq root_path
    end
  end
end

describe 'new user page' do
  it "allows you to create a new user" do
    visit '/'

    expect{
      click_on "Login"
      click_on "New User?"

      expect(current_path).to eq new_user_path

      fill_in "Username",                   with: "new_user1"
      fill_in "Email",                      with: "example@email.com"
      fill_in "First name",                 with: "danny"
      fill_in "Last name",                  with: "garcia"
      fill_in "user_password",              with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_on "Create User"
    }.to change(User, :count).by(1)
  end
end