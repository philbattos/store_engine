class ChangeDescriptionTypeInProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :description
      t.text   :description
    end
  end
end
