class Cart < ActiveRecord::Base
  store           :items
  belongs_to      :user
  attr_accessible :items


  # def add_product(product_id, quantity = 1)
  #   cart_product = CartProduct.where(product_id: product_id,
  #                                    cart_id: self.id).pop
  #   if cart_product
  #     cart_product.quantity += 1
  #   else
  #     cart_product = CartProduct.new(product_id: product_id, cart_id: self.id,
  #                                    quantity: quantity)
  #   end
  #   cart_product.save
  # end

  # def decrease_product(product_id, quantity)
  #   cart_product = CartProduct.where(product_id: product_id,
  #                                    cart_id: self.id).pop
  #   if cart_product.quantity >= 1
  #     cart_product.quantity -= quantity
  #   end
  #   remove_if_quantity_zero(cart_product)
  # end

  # def remove_if_quantity_zero(cart_product)
  #   if cart_product.quantity == 0
  #     cart_product.delete
  #   else
  #     cart_product.save
  #   end
  # end

  # def remove_product(product_id)
  #   cart_product = CartProduct.where(product_id: product_id,
  #                                    cart_id: self.id).pop
  #   cart_product.delete
  # end
end


