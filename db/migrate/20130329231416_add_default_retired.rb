class AddDefaultRetired < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :retired
      t.boolean :retired, :default => false
    end
  end
end
