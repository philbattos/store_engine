class ChargesController < ApplicationController

  def new
    # @order = Order.find(session[:order_id])
  end

  def create

    if session[:order_id] == nil
      initialize_quick_checkout
    end

    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    update_order

    redirect_to account_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

private

  def initialize_quick_checkout
    order = current_user.orders.create
    current_user.cart.items.each do |id, quantity|
      product = Product.find(id)
      order.line_items.create(product_id: id, quantity: quantity,
                              unit_price: product.price,
                              )
    end
    session[:order_id] = order.id
  end

  def update_order
    @order = Order.find_by_id(session[:order_id])
    @order.status = 'paid'
    @order.save

    session[:shopping_cart] = Hash.new(0)
    current_user.cart.items = Hash.new(0)
    current_user.cart.save

    session[:order_id] = nil

    flash[:green] = "Thank you for your purchase, you rock!"
  end

end
