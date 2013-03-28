class FixCartTable < ActiveRecord::Migration
  def change
    change_table :carts do |t|
      t.remove :session_id
      t.string :items
    end
  end
end
