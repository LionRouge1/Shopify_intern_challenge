require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        item_name: "Item Name",
        category: "Category"
      ),
      Item.create!(
        item_name: "Item Name",
        category: "Category"
      )
    ])
  end

  it "renders a list of items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Item Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Category".to_s), count: 2
  end
end
