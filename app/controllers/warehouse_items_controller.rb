class WarehouseItemsController < ApplicationController
  before_action :set_warehouse_item, except: %i[create new]
  before_action :set_warehouse

  def new
    @warehouse_item = WarehouseItem.new
  end

  def edit; end

  def create
    @warehouse_item = @warehouse.warehouse_items.new(warehouse_items_params)

    if @warehouse_item.save
      respond_to do |format|
        format.html { redirect_to warehouse_path(@warehouse), notice: 'Warehouse item created successfully'}
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @warehouse_item.update(warehouse_items_params)
      redirect_to warehouse_path(@warehouse), notice: 'Warehouse item updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse_item.destroy

    respond_to do |format|
      format.html { redirect_to warehouse_path(@warehouse), notice: 'Warehouse item deleted successfully' }
      format.turbo_stream
    end
  end

  private

  def warehouse_items_params
    params.require(:warehouse_item).permit(:item_id, :quantity)
  end

  def set_warehouse_item
    @warehouse_item = WarehouseItem.find(params[:id])
  end

  def set_warehouse
    @warehouse = Warehouse.find(params[:warehouse_id])
  end
end
