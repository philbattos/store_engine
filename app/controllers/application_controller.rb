class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_or_create_cart

private

  def find_or_create_cart
    @cart = if !session[:cart_id]
      cart = Cart.find_by_user_id(session[:user_id])
      cart ||= Cart.find_by_session_id(session[:session_id])
      cart ||= Cart.create
      session[:cart_id] = cart.id
      cart
    else
      cart = Cart.find_by_id(session[:cart_id])
      if !cart
        cart = Cart.create
        session[:cart_id] = cart.id
      end
      cart
    end
  end
end


