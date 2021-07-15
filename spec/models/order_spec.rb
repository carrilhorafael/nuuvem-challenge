require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with all params' do
    merchant = Merchant.create(address: "351 Park Avenue, NY", name: "Donuts House")
    product = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    order = Order.create(client: "Rafael Carrilho", quantity: 20, product: product) 
    expect(order).to be_valid 
  end

  it 'is invalid without client' do
    merchant = Merchant.create(address: "351 Park Avenue, NY", name: "Donuts House")
    product = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    order = Order.create(client: nil, quantity: 20, product: product) 
    expect(order).to_not be_valid
  end
  
  it 'is invalid without quantity' do
    merchant = Merchant.create(address: "351 Park Avenue, NY", name: "Donuts House")
    product = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    order = Order.create(client: "Rafael Carrilho", quantity: nil, product: product) 
    expect(order).to_not be_valid
  end

  it 'is invalid with negative quantity' do
    merchant = Merchant.create(address: "351 Park Avenue, NY", name: "Donuts House")
    product = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    order = Order.create(client: "Rafael Carrilho", quantity: -20, product: product)
    expect(order).to_not be_valid
  end

  it 'is invalid without product' do
    order = Order.create(client: "Rafael Carrilho", quantity: -20, product: nil)
    expect(order).to_not be_valid
  end

  it 'render order_price on each order' do
    merchant = Merchant.create(address: "351 Park Avenue, NY", name: "Donuts House")
    product = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    order = Order.create(client: "Rafael Carrilho", quantity: 20, product: product)
    expect(order.order_price).to eq(order.quantity * product.price)
  end

  it 'render total_price on order' do
    merchant = Merchant.create(address: "351 Park Avenue, NY", name: "Donuts House")
    product1 = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    product2 = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    product3 = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
    order1 = Order.create(client: "Rafael Carrilho", quantity: 20, product: product1)
    order2 = Order.create(client: "Rafael Carrilho", quantity: 30, product: product2)
    order3 = Order.create(client: "Rafael Carrilho", quantity: 40, product: product3)
    expect(Order.total_price).to eq(order1.quantity * product1.price + order2.quantity * product2.price + order3.quantity * product3.price)
  end
end
