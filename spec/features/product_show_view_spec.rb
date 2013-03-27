require 'spec_helper'

describe 'product show page' do

  before(:each) do
    @product = Product.create(title: "trail bike", description: "it's fast",
                              price: 69.99)
  end

  it "displays the product show view" do
    visit product_path(@product)

    expect(page).to have_content @product.title
    expect(page).to have_content @product.description
    expect(page).to have_content @product.price
  end

  it "allows me to add a product to my cart" do
    visit product_path(@product)

    click_on "Add to cart"

    expect(page).to have_content @product.title
    expect(page).to have_content @product.price
    expect(page).to have_content "Quantity:1"

  end
end