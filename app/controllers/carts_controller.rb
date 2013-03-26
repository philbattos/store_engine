class CartsController < ApplicationController

  def update
    product = Product.find_by_id(params[:product_id])
    if params[:increase]
      shopping_cart.add_product product, params[:increase].to_i
    elsif params[:decrease]
      shopping_cart.decrease_amount product, params[:decrease].to_i
    else
      shopping_cart.remove_product product
    end
    # redirect_to product_path(product)
    redirect_to :back
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