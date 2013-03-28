class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :shopping_cart, only: [:show, :index]

private

  def shopping_cart
    session[:shopping_cart] ||= Hash.new(0)
    if logged_in?
      if current_user.cart
        unless session[:shopping_cart] == current_user.cart.items
          updated_cart = session[:shopping_cart].merge(current_user.cart.items){|key, val1, val2| val1 + val2}
          current_user.cart.items = updated_cart
          current_user.cart.save
          session[:shopping_cart] = updated_cart
        end
      else
        current_user.create_cart(items: session[:shopping_cart])
      end
    end
    @cart = session[:shopping_cart].collect{|k,v| [Product.find(k), v]}#.reject{|product,quantity| quantity < 1}
  end
end