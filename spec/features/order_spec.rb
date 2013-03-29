require 'spec_helper'

describe 'Order Page' do

  context 'as a logged-in user' do
    before(:each) do
      @user = User.create(email: "dantheman@gmail.com", first_name: "dannyg",
                          last_name: "garciad", password: "thisissecure")
      @order = Order.create(status: "pending")

      visit login_path
      fill_in 'login_id', with: 'dantheman@gmail.com'
      fill_in 'password', with: 'thisissecure'
      click_button 'Login'
    end

    it "should display the order page" do
      visit cart_path
      click_on "Proceed to checkout"

      expect(current_path).to eq order_path(@order)
      expect(page).to have_content "Review your order"
    end
  end
end