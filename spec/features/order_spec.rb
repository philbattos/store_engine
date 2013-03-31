require 'spec_helper'

describe 'Order Page' do

  context 'as a logged-in user' do
    before(:each) do
      @user = User.create(email: "dantheman@gmail.com", first_name: "dannyg",
                          last_name: "garciad", password: "thisissecure")

      visit login_path
      fill_in 'login_id', with: 'dantheman@gmail.com'
      fill_in 'password', with: 'thisissecure'
      click_button 'Login'

      visit cart_path
      click_on "Proceed to checkout"
      @order = Order.find(1)

    end

    it "should display the order page" do
      # @order = Order.create(status: "pending")
      expect(current_path).to eq order_path(@order)
      expect(page).to have_content "Review your order"
      expect(page).to have_link    "Place your order"
    end

    it "displays line items for that order" do

      product = Product.create(title: "tv", description: "something", price: 9.99)
      @order.line_items.create(product_id: product.id, quantity: 3,
                               unit_price: product.price,
                               sub_total: (3 * product.price)
                               )

      expect(page).to have_content "#{product.title}"

    end
  end
end