require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      client: "Client",
      product: nil,
      quantity: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Client/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
