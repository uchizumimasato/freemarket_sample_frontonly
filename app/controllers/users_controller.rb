class UsersController < ApplicationController
  before_action :set_ransack_q

  def show
    @user = current_user
  end

  def likes
    likes = current_user.likes
    @products = likes.map(&:product)
  end

  def listings
    @items = current_user.sell_items.where(transaction_status: [:buy])
  end

  def in_progress
    @items = current_user.sell_items.where(transaction_status: [:trade])
  end

  def completed
    @items = current_user.sell_items.where(transaction_status: [:selled])
  end

  def purchase
    @items = Item.where(transaction_status: 1, seller_id: current_user.id)
  end

  def purchased
    @items = Item.where(transaction_status: 2, seller_id: current_user.id)
  end

  private

  def set_ransack_q
    @q = Item.ransack(params[:q])
  end
end
