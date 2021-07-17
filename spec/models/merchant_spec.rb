require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it 'is valid with all params' do
    merchant = Merchant.create(name: "Donuts House", address: "351 Park Avenue, NY") 
    expect(merchant).to be_valid 
  end
  context 'validations test' do
    it 'when without name' do
      merchant = Merchant.create(name: nil, address: "351 Park Avenue, NY") 
      merchant.valid?
      expect(merchant.errors[:name]).to include("can't be blank")
    end
    
    it 'when without address' do
      merchant = Merchant.create(name: "Donuts House", address: nil)
      merchant.valid?
      expect(merchant.errors[:address]).to include("can't be blank")
    end
  end

end
