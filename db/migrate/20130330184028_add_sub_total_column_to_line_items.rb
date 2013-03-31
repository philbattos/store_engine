class AddSubTotalColumnToLineItems < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.integer :sub_total
    end
  end
end
