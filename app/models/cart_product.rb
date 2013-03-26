# class CartProduct < ActiveRecord::Base
#    attr_accessible :product_id, :cart_id
#    belongs_to :cart
#    belongs_to :product
#     # TODO: quantity
# end

class CartProduct

  attr_reader :product
  attr_accessor :quantity

  def initialize(params)
    @product = Product.find_by_id params[:product_id]
    @quantity = params[:quantity]
  end

  def title
    @product.title
  end

  def price
    @product.price
  end

  def id
    @product.id
  end
end