require 'rails_helper'
RSpec.describe DeletedItem, type: :model do
  item = Item.create(item_name: 'Choux', price: 45, category: 'fruit', expire_at: '2023-05-17')
  subject { DeletedItem.new(item:, description: 'out of stuck') }
  before { subject.save }

  it 'should be valid with valid parametter' do
    expect(subject).to be_valid
  end

  it 'item id mast exist' do
    subject.item_id = nil
    expect(subject).to_not be_valid
  end

  it 'description mast exist' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'description should have 5 minimum of length' do
    subject.description = 'out'
    expect(subject).to_not be_valid
  end
end
