require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do
    merchant = Merchant.create(address: "351 Park Avenue, NY", name: "Donuts House")
    @product = Product.create(description: "A little donut", price: 1.30, merchant: merchant)
  end

  it 'is valid with all params' do
    order = Order.create(client: "Rafael Carrilho", quantity: 20, product: @product) 
    expect(order).to be_valid 
  end
  context 'validations test' do        
    it 'when without client' do
      order = Order.create(client: nil, quantity: 20, product: @product) 
      order.valid?
      expect(order.errors[:client]).to include("can't be blank")
    end
    
    it 'when without quantity' do
      order = Order.create(client: "Rafael Carrilho", quantity: nil, product: @product) 
      expect(order.errors[:quantity]).to include("can't be blank")
    end
  
    it 'when negative quantity' do
      order = Order.create(client: "Rafael Carrilho", quantity: -20, product: @product)
      order.valid?
      expect(order.errors[:quantity]).to include("must be greater than 0")
    end
  
    it 'when without product' do
      order = Order.create(client: "Rafael Carrilho", quantity: 20, product: nil)
      order.valid?
      expect(order.errors[:product]).to include("must exist")
    end
  end
  context 'when need to render prices' do
    
    it 'render order_price on each order' do
      order = Order.create(client: "Rafael Carrilho", quantity: 20, product: @product)
      expect(order.order_price).to eq(order.quantity * @product.price)
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
  
end
