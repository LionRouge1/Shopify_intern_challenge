require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  let(:item) {
    Item.create!(
        item_name: 'Tomato',
        price: 67,
        category: 'Vegetable',
        expire_at: '2021-05-01'
    )
  }

  before(:each) do
    assign(:item, item)
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(item), "post" do

      assert_select "input[name=?]", "item[item_name]"

      assert_select "input[name=?]", "item[category]"
    end
  end
end
