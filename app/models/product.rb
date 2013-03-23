class Product < ActiveRecord::Base
  has_many :cart_products
  #belongs_to :cart
  attr_accessible :description, :price, :title, :photo

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  validates :description, presence: true

  validates :price, presence: :true,
            :format => { :with => /^\d+??(?:\.\d{0,2})?$/ },
            numericality: { greater_than: 0 }
end