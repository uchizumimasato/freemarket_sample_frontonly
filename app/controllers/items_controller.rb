class ItemsController < ApplicationController
  before_action :login_required, only: [:new, :create]

  def index
    @new_items = Item.order(created_at: "DESC").limit(4)
    @brand_items = Item.where(brand_id: 1).limit(4)
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(items_params)
    if item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :item_status, :delivery_fee, :delivery_method, :delivery_date, :prefecture, :price, :size, :transaction_status, :category_id, :brand_id, :seller_id, :buyer_id, {images: []})
  end
end
