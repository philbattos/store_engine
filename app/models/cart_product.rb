class CartProduct < ActiveRecord::Base
   attr_accessible :product_id, :cart_id, :quantity
   belongs_to :cart
   belongs_to :product

  def product
    Product.find(product_id)
  end
end

