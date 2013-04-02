class Order < ActiveRecord::Base
  has_many :line_items
  attr_accessible :status

  scope :with_status, lambda{ |status| where(status: status) }

  # def self.with_status(status)
  #   where(status: status)
  # end

  def self.statuses
    select("distinct status").collect(&:status).compact
  end

end
