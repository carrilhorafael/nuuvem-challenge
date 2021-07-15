require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with all params' do
    merchant = Merchant.create(name: "Donuts House", address: "351 Park Avenue, NY")
    product = Product.create(description: "Chocolate Donuts", price: 5.32, merchant: merchant) 
    expect(product).to be_valid 
  end

  it 'is invalid without description' do
    merchant = Merchant.create(name: "Donuts House", address: "351 Park Avenue, NY")
    product = Product.create(description: nil, price: 5.32, merchant: merchant) 
    expect(product).to_not be_valid
  end
  
  it 'is invalid without price' do
    merchant = Merchant.create(name: "Donuts House", address: "351 Park Avenue, NY")
    product = Product.create(description: "Chocolate Donuts", price: nil, merchant: merchant) 
    expect(product).to_not be_valid
  end

  it 'is invalid without merchant' do
    product = Product.create(description: "Chocolate Donuts", price: 5.32, merchant: nil) 
    expect(product).to_not be_valid
  end
end
