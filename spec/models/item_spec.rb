require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { Item.new(item_name: 'Choux', price: 45, category: 'fruit', expire_at: '2023-05-17') }
  before { subject.save }

  it 'Item name should be present' do 
    subject.item_name = nil
    expect(subject).to_not be_valid
  end

  it 'Price should be greater than 0' do
    subject.price = 0
    expect(subject).to_not be_valid
  end

  it 'Category should be present' do
    subject.category = nil
    expect(subject).to_not be_valid
  end
end
