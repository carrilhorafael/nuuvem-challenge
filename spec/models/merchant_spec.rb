require 'rails_helper'

describe Merchant, type: :model do
  it 'is valid with all params' do
    merchant = Merchant.create!(name: "Donuts House", address: "351 Park Avenue, NY") 
    expect(merchant).to be_valid 
  end

  it 'is invalid without name' do
    merchant = Merchant.create(name: nil, address: "351 Park Avenue, NY") 
    merchant.valid?
    expect(merchant.errors[:name]).to include("can't be blank")
  end
  
  it 'is invalid without address' do
    merchant = Merchant.create(name: "Donuts House", address: nil) 
    merchant.valid?
    expect(merchant.errors[:address]).to include("can't be blank")
  end
  # it { expect(subject).to be_valid }
  # it { expect(subject).to be_valid }

end
