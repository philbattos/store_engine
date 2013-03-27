require "spec_helper"

describe "cart page" do
  context "ready to purchase" do
    it "has a checkout button" do
      visit cart_path
      expect(page).to have_link "Checkout"
    end
  end

  context "after clicking 'checkout'" do
    it "should be redirected to the confirmation page" do
      visit cart_path
      click_link "Checkout"
      expect( current_path ).to eq '/confirmation'
      expect( page ).to have_content 'Confirmation Page'
    end
  end
end