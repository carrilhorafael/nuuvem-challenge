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
end
