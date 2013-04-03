class ProductsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]

  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    category_ids = params[:product].delete(:categories) || []
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])

        flash[:green] = "'#{@product.title}' Updated!"

        categories = category_ids.collect{ |id| Category.find_by_id(id) }.compact
        @product.categories = categories
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @product = Product.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    category_ids = params[:product].delete(:category_ids) || []
    categories = category_ids.collect{ |id| Category.find_by_id(id) }.compact
    @product = Product.new(params[:product])
    @product.categories = categories

    respond_to do |format|
      if @product.save
        flash[:green] = "Product successfully created!"
        format.html { redirect_to "/products/new", notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
end
