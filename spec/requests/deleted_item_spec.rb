require 'rails_helper'

RSpec.describe 'DeletedItems', type: :request do
  item = Item.create(item_name: 'Choux', price: 45, category: 'fruit', expire_at: '2023-05-17')
  let(:valid_attributes) { { item_id: item.id, description: 'out of stuck' } }
  let(:invalid_attributes) { { item: nil, description: 'out' } }

  describe 'GET /index' do
    it 'should render successful response' do
      get deleted_items_path
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'should renders successful response' do
      deleted = DeletedItem.create!(valid_attributes)
      get edit_deleted_path(deleted)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'Post with valid attributes' do
      it 'should create a new deletedItem' do
        post deleted_items_path, params: { deleted_item: valid_attributes, format: :js }
        count = DeletedItem.all.count
        expect(count).to eq(1)
      end
    end

    context 'Post with invalid attributes' do
      it 'should not create a new deletedItem' do
        expect do
          post deleted_items_path, params: { deleted_item: invalid_attributes, format: :js }
        end.to change(DeletedItem, :count).by(0)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'with valid attributes' do
      it 'should destroy deletedItem' do
        p valid_attributes
        deleted = DeletedItem.create!(valid_attributes)
        expect do
          delete deleted_url(deleted)
        end.to change(DeletedItem, :count).by(-1)
      end

      it 'should redirect to deleted_items path' do
        deleted = DeletedItem.create(valid_attributes)
        delete deleted_path(deleted)
        expect(response).to redirect_to(deleted_items_path)
      end
    end

    context 'with invalid attributes' do
      it 'should reponse with 422 status' do
        deleted = DeletedItem.create!(invalid_attributes)
        delete deleted_path(deleted)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid attributes' do
      it 'should update description' do
        deleted = DeletedItem.create!(valid_attributes)
        patch deleted_path(deleted), params: { deleted_item: { description: 'to much of them' } }
        deleted.reload
        expect(deleted.description).to be('to much of them')
      end

      it 'should render to deleted items path' do
        deleted = DeletedItem.create!(valid_attributes)
        patch deleted_path(deleted), params: { deleted_item: { description: 'to much of them' } }
        deleted.reload
        expect(response).to redirect_to(deleted_items_path(deleted))
      end
    end

    context 'with invalid attributes' do
      it 'should response with 422 status' do
        deleted = DeletedItem.create!(invalid_attributes)
        patch deleted_path(deleted), params: { deleted_item: { description: 'to much of them' } }
        deleted.reload
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
