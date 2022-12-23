require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        item_name: 'Tomato',
        price: 67,
        category: 'Vegetable',
        expire_at: '2021-05-01'
      ),
      Item.create!(
        item_name: 'Choux',
        price: 6,
        category: 'Vegetable',
        expire_at: '2022-05-11'
      )
    ])
  end

  it "renders a list of items" do
    render
    cell_selector = 'div>div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Category".to_s), count: 2
  end
end
