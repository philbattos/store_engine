class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_filter :shopping_cart, only: [:show, :index]

  def customer_order
    if logged_in?
      order = current_user.orders.create(status: "pending")
      current_user.cart.items.each do |id, quantity|
        product = Product.find(id)
        order.line_items.create(product_id: id, quantity: quantity,
                                price: product.price)
      end
      redirect_to order_path(order)
    else
      flash[:red] = "Oops! Seems like you're not logged in, please log in to complete your order."
      # redirect_back_or_to(login_path)
      redirect_to(login_path)
    end
  end

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
