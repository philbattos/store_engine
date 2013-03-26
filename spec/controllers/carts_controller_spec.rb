require 'spec_helper'

describe CartsController do

  describe "#update" do
    it "adds product to the cart" do
      product = Product.create(title: "bike1", description: "it has wheels",
                               price: 699.99)

      put :update, {product_id: product.id}

      # cart = Cart.last
      # expect(cart.products).to eq [product]
      cart = Cart.new(cookies)
      cart.add_product(product)
      added_product = cart.products.last
      expect(added_product.product.id).to eq product.id

    end
  end
end
