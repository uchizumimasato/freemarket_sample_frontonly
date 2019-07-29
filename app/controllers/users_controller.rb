class UsersController < ApplicationController
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
    @products = Product.is_purchased(current_user.id)
                       .where(transaction_status: 'in_progress')
  end

  def purchased
    @products = Product.is_purchased(current_user.id)
                       .where(transaction_status: 'completed')
  end
end
