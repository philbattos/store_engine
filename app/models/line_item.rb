class LineItem < ActiveRecord::Base
 attr_accessible :product_id, :unit_price, :quantity, :sub_total
end
