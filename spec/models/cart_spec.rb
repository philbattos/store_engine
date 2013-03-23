require 'spec_helper'

describe Cart do

  before(:each) do
    @cart = Cart.create

    @product1 = Product.create(title: "bike1", description: "kind of bike",
                              price: 75.00)

    @product2 = Product.create(title: "bike2", description: "kind of bike",
                               price: 100.00)
  end


  context "when one product is added"
    it "has a quantity of 1 for that product"

  context "when it has many products" do

    it "displays the correct total price" do
      @cart.add(@product1)
      @cart.add(@product2)

      expect(@cart.total_price).to eq 175.00
    end

    it "displays the correct quantity" do
      expect(@cart.products[:product2]).to eq 1

      @cart.product2.increase_quantity(2)
      expect(@cart.products[:product2]).to eq 3


      @cart.product2.decrease_quantity(1)
      expect(@cart.products[:product2]).to eq 2
    end
  end
end