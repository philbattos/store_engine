class Order < ActiveRecord::Base
  has_many :line_items
  attr_accessible :status
end
