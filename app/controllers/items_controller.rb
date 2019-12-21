class ItemsController < ApplicationController
  before_action :login_required, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]
  before_action :set_category, only: [:show, :edit]
  before_action :set_ransack_q, expect: [:new, :edit]
  protect_from_forgery :except => [:create]

  def index
    @new_items = Item.order(created_at: "DESC").limit(4)
    @brand_items = Item.where(brand_id: 1).limit(4)
    @q = Item.ransack(params[:q])
  end

  def show
  end

  def new
    @item = Item.new
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

  def destroy
    @item.images.each do |image|
      image.purge
    end

    @item.delete
    redirect_to root_path
  end

  def purchase_new
    @item = Item.find(params[:id])
  end

  def purchase
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    customer = current_user.card.customer_id
    Payjp::Charge.create(
      amount: 3500,
      currency: 'jpy',
      customer: customer
    )
    redirect_to root_path
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @items = @q.result
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :delivery_fee, :delivery_method_id, :delivery_date, :prefecture_id, :price, :item_status, :size, :transaction_status, :category_id, :brand_id, :seller_id, :buyer_id, { images: [] })
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @category = Category.find(@item.category_id)
  end

  def set_categories
    @categories = Category.find(1, 11)
  end

  def set_ransack_q
    @q = Item.ransack(params[:q])
  end
end
