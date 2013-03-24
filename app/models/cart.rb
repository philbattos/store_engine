class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :cart_products
  has_many :products, through: :cart_products


  def add(product_id)
    CartProduct.create(product_id: product_id, cart_id: self.id)
    self.reload
  end
end
