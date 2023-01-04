class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[show edit update destroy]

  def index
    @warehouses = Warehouse.all
  end

  def show
    @wa
  end

  def new
    @warehouse = Warehouse.new
  end

  def edit; end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to @warehouse, notice: 'Warehouse was successfully created.'
    else
      render :new
    end
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse, notice: 'Warehouse was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @warehouse.destroy
      redirect_to @warehouse, notice: 'Warehouse was successfully destroyed.'
    else
      flash[:alert] = 'Warehouse was not destroyed.'
      redirect_to @warehouse, alert: 'Warehouse was not destroyed.'
    end
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :country, :city, :address)
  end
end
