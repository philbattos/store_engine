# class Cart < ActiveRecord::Base
#   # attr_accessible :title, :body
#   has_many :cart_products
#   has_many :products, through: :cart_products


#   def add(product_id)
#     CartProduct.create(product_id: product_id, cart_id: self.id)
#     self.reload
#   end
# end

class Cart

  attr_reader :cookies
  attr_accessor :products

  def initialize(cookies)
    @cookies = cookies

    if cookies[:shopping_cart]
      contents = JSON.parse(cookies[:shopping_cart])
      @products = contents.map do |product_id, quantity|
        CartProduct.new product_id: product_id, quantity: quantity
      end
    else
      @products = []
    end
  end

  def add_product(product, quantity=1)
    cart_product = products.find{|existing_product| existing_product.id == product.id}
    if cart_product
      cart_product.quantity += quantity
    else
      products << CartProduct.new(product_id: product.id, quantity: 1)
    end
    save
  end

  def decrease_amount(product, quantity)
    cart_product = products.find{|existing_product| existing_product.id == product.id}

    if cart_product.quantity >=  1
      cart_product.quantity -= quantity
    elsif cart_product.quantity == 0
      products.delete(cart_product)
    end
    save
  end

  def remove_product(product)
    cart_product = products.find{|existing_product| existing_product.id == product.id}
    products.delete(cart_product)
    save
  end

  def save
    product_hash = Hash.new(0)
    products.each do |product|
      if product.quantity == 0
        products.delete(product)
      else
        product_hash[product.id] += product.quantity
      end
    end
    cookies.permanent[:shopping_cart] = product_hash.to_json
  end

  def destroy
    cookies.delete :shopping_cart
  end
end

