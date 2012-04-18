class OrdersController < ApplicationController

  before_filter :require_login
  before_filter :belongs_to_current_user?, only: [:show]

  def new
    redirect_to new_credit_card_path if current_user.credit_cards.empty?

    @credit_card = current_user.credit_cards.last
    @order = Order.new
  end

  def index
    @orders = current_user.orders.desc
  end

  def create
    @order = current_user.orders.create
    @order.build_order_from_cart(current_cart)
    @order.stripe_customer_token = params[:order][:customer_token]
    @order.save

    if @order.find_credit_card && @order.charge(current_cart)
      current_cart.destroy      
      redirect_to @order, :notice => "Thank you for placing an order."
    else
      render :new
    end
  end

  def show
    @order = current_user.orders.find_by_id(params[:id])
    redirect_to root_path, :notice => "Order not found." if @order.nil?
  end

private
  def belongs_to_current_user?
    redirect_to_last_page unless Order.user_by_order_id(params[:id]) == current_user
  end

end
