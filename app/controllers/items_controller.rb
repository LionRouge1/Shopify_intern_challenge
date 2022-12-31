class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    @items = Item.left_joins(:deleted_item)
      .where(deleted_items: { item_id: nil })
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    if @item.update(item_params)
      redirect_to item_url(@item), notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:item_name, :price, :category, :expire_at)
  end
end
