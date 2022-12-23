require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    assign(:item, Item.create!(
      item_name: 'Tomato',
      price: 67,
      category: 'Vegetable',
      expire_at: '2021-05-01'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Name/i)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Price/i)
    expect(rendered).to match(/Expire at/i)
  end
end
