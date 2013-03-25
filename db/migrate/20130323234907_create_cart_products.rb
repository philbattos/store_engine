class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.references :product
      t.references :cart

      t.timestamps
    end

    add_index :cart_products, :product_id
    add_index :cart_products, :cart_id
  end
end
