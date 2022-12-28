class DeletedItemsController < ApplicationController
  before_action :set_deleted_item, only: %i[edit update destroy]
  def index
    @deleted_items = DeletedItem.includes(:item)
  end

  def edit; end

  def create
    @item_id = params[:deleted_item][:item_id]
    @deleted_item = DeletedItem.create(deleted_params)
  end

  def update
    if @deleted_item.update(deleted_params)
      redirect_to deleted_items_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @deleted_item.destroy
      redirect_to deleted_items_path, notice: 'Item undeleted successfully'
    else
      flash.now[:alert] = 'Sorry something went wrong'
      render :index
    end
  end

  private

  def set_deleted_item
    @deleted_item = DeletedItem.find(params[:id])
  end

  def deleted_params
    params.require(:deleted_item).permit(:description, :item_id)
  end
end
