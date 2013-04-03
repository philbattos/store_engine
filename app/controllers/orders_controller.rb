class OrdersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :show

  def show
    order = Order.find_by_id(params[:id])
    if logged_in? && order.user_id == current_user.id
      session[:order_id] = order.id
      @order = order
    elsif logged_in? && current_user.admin == true
      session[:order_id] = order.id
      @order = order
    else
      flash[:red] = "You must be logged in to view your orders. "
      redirect_to login_path
    end
  end

  def index
    @statuses = @orders.collect { |order| order.status }.compact.uniq

    if params[:filters]
      @orders = Order.with_status(params[:filters])
    else
      @orders = Order.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    line_item_id = params[:line_item_id]
    line_item = LineItem.find_by_id(line_item_id)
    if params[:increase]
      line_item.quantity += 1
      line_item.save
    elsif params[:decrease]
      line_item.quantity -= 1
      line_item.save
    else
      @order.line_items.delete(line_item)
    end


    respond_to do |format|
      if @order.update_attributes(params[:order])

        format.html { redirect_to edit_order_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
end
