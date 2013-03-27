require 'spec_helper'

describe CartsController do

  describe "#update" do
    it "adds product to the cart" do
      product = Product.create(title: "bike1", description: "it has wheels",
                               price: 699.99)

      @request.env["HTTP_REFERER"] = '/cart'

      put :update, {increase: 1, product_id: product.id}

      cart = Cart.last
      cart.add_product(product)
      expect(cart.products).to eq [product]

    end
  end
end
