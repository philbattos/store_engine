class AddSubtotalColumnToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.integer :sub_total
    end
  end
end
