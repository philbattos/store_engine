class Cart < ActiveRecord::Base
  has_many :cart_products
  has_many :products, through: :cart_products

  # belongs_to :users

  # attr_accessible


  # def products

  # end

  # def add_product(id)

  # end
end
