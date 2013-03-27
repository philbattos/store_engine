require 'spec_helper'

describe 'home page' do

  before(:each) do
    @product = Product.create(title: "trail bike", description: "it's fast",
                              price: 69.99)
  end

  it "displays the products index view" do
    visit '/'
    expect(page).to have_content 'Team Solo Store'
  end

  it "should display button to product detail" do
    visit '/'

    page.should have_link("View details")
  end

  it "let's the user click on a product" do
    visit '/'

    click_on 'View details'

    expect(current_path).to eq product_path(@product)
  end

  it "let's the user click on a category" do
    @category = Category.create(name: "Tablets")

    visit '/'

    click_on 'Tablets'

    expect(current_path).to eq category_path(@category)
  end
end
