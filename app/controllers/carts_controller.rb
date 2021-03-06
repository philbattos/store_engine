class CartsController < ApplicationController

  def update
    product_id = params[:product_id].to_i
    if params[:increase]
      session[:shopping_cart][product_id] += 1
    elsif params[:decrease]
      session[:shopping_cart][product_id] -= 1
      remove_if_zero(product_id)
    else
      remove_from_cart(product_id)
    end
    save_update
    redirect_to :back
  end

  def show
    @cart
  end

private
  def save_update
    if logged_in?
      current_user.cart.items = session[:shopping_cart]
      current_user.cart.save
    end
  end

  def remove_if_zero(id)
    if session[:shopping_cart][id] == 0
      remove_from_cart(id)
    end
  end

  def remove_from_cart(id)
    session[:shopping_cart].delete(id)
  end
end