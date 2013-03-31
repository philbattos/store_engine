class OrdersController < ApplicationController

  def show
    order = Order.find_by_id(params[:id])
    if logged_in? && order.user_id == current_user.id
      session[:order_id] = order.id
      @order = order
    else
      flash[:red] = "You must be logged in to view your orders. "
      redirect_to login_path
    end
  end
end
