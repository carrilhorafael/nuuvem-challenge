class Order < ApplicationRecord
  belongs_to :product

  validates :client, :product, :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}

  def order_price
    self.quantity * self.product.price
  end
  def self.total_price
    sum = 0
    all_prices = Order.all.map{|order| order.order_price}
    all_prices.each do |price|
      sum += price
    end
    sum
  end
end
