require 'rails_helper'

RSpec.describe DeletedItemsController, type: :routing do
  describe 'deleted items routing' do
    it 'should render deleted items index' do
      expect(get(deleted_items_path)).to route_to('deleted_items#index')
    end

    it 'should render deleted items edit' do
      expect(get(edit_deleted_path(1))).to route_to('deleted_items#edit', id: '1')
    end

    it 'should render deleted items update' do
      expect(patch(deleted_path(1))).to route_to('deleted_items#update', id: '1')
    end

    it 'should render deleted items create' do
      expect(post(deleted_items_path)).to route_to('deleted_items#create')
    end

    it 'should render deleted items destroy' do
      expect(delete(deleted_path(1))).to route_to('deleted_items#destroy', id: '1')
    end
  end
end
