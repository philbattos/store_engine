class ChargesController < ApplicationController

  def new
    # @order = Order.find(session[:order_id])
  end

  def create
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

  def update_order
    @order = Order.find(session[:order_id])
    @order.status = 'paid'
    @order.save

    session[:shopping_cart] = Hash.new(0)
    current_user.cart.items = Hash.new(0)
    current_user.cart.save

    flash[:green] = "Thank you for your purchase, you rock!"
  end

end
