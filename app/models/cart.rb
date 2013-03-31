class Cart < ActiveRecord::Base
  store           :items
  belongs_to      :user
  attr_accessible :items
end


