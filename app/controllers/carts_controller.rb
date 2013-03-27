class CartsController < ApplicationController

  def update
    @cart = Cart.find(current_cart_id)
    if params[:increase]
      @cart.add_product(params[:product_id].to_i, params[:increase].to_i)
    elsif params[:decrease]
      @cart.decrease_product(params[:product_id].to_i, params[:decrease].to_i)
    else
      @cart.remove_product(params[:product_id].to_i)
    end
    redirect_to :back
  end

  def show
    @cart = Cart.find(current_cart_id)
  end
end