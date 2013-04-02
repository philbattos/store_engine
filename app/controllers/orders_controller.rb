class OrdersController < ApplicationController
  load_and_authorize_resource
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
    if params[:filter]
      @orders = Order.where(:status => params[:filter])
    else
      @orders = Order.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def update
    # status = params[:order].delete(:status)
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])

        # categories = category_ids.collect{ |id| Category.find_by_id(id) }.compact
        # @product.categories = categories

        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
end
