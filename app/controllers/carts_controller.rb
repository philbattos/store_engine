class CartsController < ApplicationController

  def update
    @cart = Cart.create
    @cart_product = CartProduct.create(product_id: params[:product_id], cart_id: @cart.id)
    # Check if cart_id is in session
    # if it doesn't exist create cart, and store that id in session
    # if it does exist, it'll find that cart by cart_id

    redirect_to cart_path
  end

  def show
    # find the cart by cart_id

  end
end
