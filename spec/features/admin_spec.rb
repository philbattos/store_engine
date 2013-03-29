require 'spec_helper'
describe "admin dashboard" do
  context "administrator signs in with valid credentials" do
    it "accesses the dashboard" do
      User.create(
        username: "admin",
        first_name: "dan",
        last_name: "mee",
        email: "user@example.com",
        admin: true,
        password: "secrettt",
        password_confirmation: "secrettt")

      visit root_path
      click_link "Login"
      fill_in :login_id, with: "admin"
      fill_in :password, with: "secrettt"
      click_button "Login"

      current_path.should eq admin_path
      within 'h1' do
        page.should have_content 'Administration'
      end
      page.should have_content 'Manage Users'
      page.should have_content 'New Products'
    end
  end

  context "user tries to access admin dashboard before logging in" do
    it "redirects to home page" do
      visit admin_path

      current_path.should eq root_path
        page.should have_content 'Login'
    end
  end

  describe "article management" do
    before :each do
      user = User.create(
                          username: "admin",
                          first_name: "dan",
                          last_name: "mee",
                          email: "user@example.com",
                          admin: true,
                          password: "secrettt",
                          password_confirmation: "secrettt")
      visit root_path
      click_link "Login"
      fill_in :login_id, with: "admin"
      fill_in :password, with: "secrettt"
      click_button "Login"
    end

    it "adds a product" do
      click_link 'New Products'
      current_path.should eq new_product_path

      expect{
        fill_in "Title", with: "vitamins"
        fill_in "Description", with: "for your health"
        fill_in "Price", with: 600
        click_button "Create Product"
      }.to change(Product, :count).by(1)

      current_path.should eq new_product_path
      page.should have_content "New product"
    end

    # it "edits a product" do
    #   click_link 'Edit Products'
    #   current_path.should eq edit_product_path

    #   expect{
    #     fill_in "Title", with: "vitamins"
    #     fill_in "Description", with: "for your health"
    #     fill_in "Price", with: 600
    #     click_button "Create Product"
    #   }.to change(Product, :count).by(1)

    #   current_path.should eq new_product_path
    #   page.should have_content "New product"

    # end
  end
end

