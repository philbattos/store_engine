class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :cart

private

  def cart
   @cart = Cart.find(current_cart_id)
  end

  def current_cart_id
    unless session[:cart_id]
      cart = Cart.find_by_user_id(session[:user_id])
      cart ||= Cart.find_by_session_id(session[:session_id])
      cart ||= Cart.create
      session[:cart_id] = cart.id
    end
    session[:cart_id]
  end
end
