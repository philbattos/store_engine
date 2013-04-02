class Product < ActiveRecord::Base

  attr_accessible :retired, :categories, :category_list, :category_ids

  has_many :product_categories
  has_many :categories, through: :product_categories

  attr_accessible :description, :price, :title, :photo

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  validates :description, presence: true

  validates :price, presence: :true,
            :format => { :with => /^\d+??(?:\.\d{0,2})?$/ },
                                  numericality: { greater_than: 0 }
  def category_list
    categories.join(", ")
  end

  def category_list=(categories_string)
    category_names = categories_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by_name(name) }
    self.categories = new_or_found_categories
  end
end
