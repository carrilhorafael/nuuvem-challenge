require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with all params' do
    product = Product.create!(description: "Chocolate Donuts'", price: 5.32) 
    expect(product).to be_valid 
  end

  it 'is invalid without description' do
    product = Product.create!(description: nil, price: 5.32) 
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end
  
  it 'is invalid without price' do
    product = Product.create!(description: "Chocolate Donuts'", price: nil)  
    product.valid?
    expect(product.errors[:address]).to include("can't be blank")
  end
end
