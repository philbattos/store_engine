require 'spec_helper'

describe Cart do

  describe "adding product to a cart" do
    it "includes a product after it is added" do
      cart = Cart.create
      product = Product.create(title: "bike1", description: "it has wheels",
                               price: 699.99)
      cart.add_product(product.id)
      expect(cart.products).to eq [product]
    end
  end
end
