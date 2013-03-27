class CartsController < ApplicationController

  def update
    if params[:increase]
      @cart.add_product(params[:product_id].to_i, params[:increase].to_i)
    elsif params[:decrease]
      @cart.decrease_product(params[:product_id].to_i, params[:decrease].to_i)
    else
      @cart.remove_product(params[:product_id].to_i)
    end
    redirect_to :back
  end

  def show
    @cart
  end

  def confirmation
    info = []
    info << User.all
    info << Product.all
    @info = info

    #create an order from cart contents
      #user_id
      #total
      #Order.rb has_many line_items
    #order = Order.new()
    #create line_items from order contents
    #show order contents
    #@order = order
  end
end