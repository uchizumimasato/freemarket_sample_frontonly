class ItemsController < ApplicationController
  before_action :login_required, only: [:new, :create]
  before_action :set_item_category, only: [:show, :edit, :update]

  def index
    @new_items = Item.order(created_at: "DESC").limit(4)
    @brand_items = Item.where(brand_id: 1).limit(4)
  end

  def show
  end

  def new
    @item = Item.new
    @categories = Category.find(1, 11)
  end

  def create
    item = Item.new(items_params)
    if item.save
      redirect_to root_path
    else
      @item = Item.new
      @categories = Category.find(1, 11)
      render :new
    end
  end

  def edit
    if @item.delivery_fee == 1
      @delivery_methods = DeliveryMethod.all[0..3]
    else
      @delivery_methods = DeliveryMethod.all
    end
  end

  def update
    @item.delete_images(params[:delete_ids]) if params[:delete_ids].present?

    if @item.update(items_params)
      redirect_to item_path(@item)
    elsif @item.images
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :delivery_fee, :delivery_method_id, :delivery_date, :prefecture_id, :price, :item_status, :size, :transaction_status, :category_id, :brand_id, :seller_id, :buyer_id, { images: [] })
  end

  def set_item_category
    @item = Item.find(params[:id])
    @category = Category.find(@item.category_id)
    @categories = Category.find(1, 11)
  end
end
