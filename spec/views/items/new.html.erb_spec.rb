require 'rails_helper'

RSpec.describe 'items/new', type: :view do
  before(:each) do
    assign(:item, Item.new(
                    item_name: 'Tomato',
                    price: 67,
                    category: 'Vegetable',
                    expire_at: '2021-05-01'
                  ))
  end

  it 'renders new item form' do
    render

    assert_select 'form[action=?][method=?]', items_path, 'post' do
      assert_select 'input[name=?]', 'item[item_name]'

      assert_select 'input[name=?]', 'item[category]'
    end
  end
end
