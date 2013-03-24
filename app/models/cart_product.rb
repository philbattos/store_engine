class CartProduct < ActiveRecord::Base
   attr_accessible :product_id, :cart_id
   belongs_to :cart
   belongs_to :product
end
