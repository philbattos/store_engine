class ApplicationController < ActionController::Base
  protect_from_forgery

   before_filter :shopping_cart

   private

  def shopping_cart
   @cart = Cart.new(cookies)
  end
end
