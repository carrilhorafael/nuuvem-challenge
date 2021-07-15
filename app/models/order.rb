class Order < ApplicationRecord
  belongs_to :product

  validates :client, :product, :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}

  def total_price
    self.quantity * self.product.price
  end
end
