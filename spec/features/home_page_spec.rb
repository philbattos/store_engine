require 'spec_helper'

describe 'home page' do

  before(:each) do
    @product = Product.create(title: "trail bike", description: "it's fast",
                              price: 69.99)
  end

  it "displays the products index view" do
    visit '/'
    expect(page).to have_content 'Products#index'
  end

  it "should display link to product detail" do
    visit '/'

    page.should have_link("trail bike")
  end

  it "let's the user click on a product" do
    visit '/'

    click_on 'trail bike'

    expect(current_path).to eq product_path(@product)
  end
end
