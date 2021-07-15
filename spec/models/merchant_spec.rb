require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it 'is valid with all params' do
    merchant = Merchant.create!(name: "Donuts House", address: "351 Park Avenue, NY") 
    expect(merchant).to be_valid 
  end

  it 'is invalid without name' do
    merchant = Merchant.create(name: nil, address: "351 Park Avenue, NY") 
    expect(merchant).to_not be_valid
  end
  
  it 'is invalid without address' do
    merchant = Merchant.create(name: "Donuts House", address: nil)
    expect(merchant).to_not be_valid
  end

end
