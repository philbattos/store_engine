class CartsController < ApplicationController

  def update
    product = Product.find_by_id(params[:product_id])
    shopping_cart.add_product product, params[:increase].to_i
    # shopping_cart.remove_product product, params[:remove]
    shopping_cart.decrease_amount product, params[:decrease].to_i
    redirect_to product_path(product)
  end

  def show
    @cart = shopping_cart
  end

  def destroy
    shopping_cart.destroy
    redirect_to cart_path
  end

  private

  def shopping_cart
    Cart.new(cookies)
  end

end