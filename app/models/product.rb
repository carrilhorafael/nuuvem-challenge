class Product < ApplicationRecord
  belongs_to :merchant
  has_many :orders
  validates :description, :price, :merchant, presence: true
end
