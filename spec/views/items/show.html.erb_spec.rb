require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    assign(:item, Item.create!(
      item_name: "Item Name",
      category: "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Name/)
    expect(rendered).to match(/Category/)
  end
end
