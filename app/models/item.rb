class Item < ApplicationRecord
  # enum
  enum transaction_status: [:buy, :trade, :selled]

  # アソシエーション
  has_many_attached :images
  belongs_to :category
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  # バリデーション
  validates :name, presence: true
  validates :description, presence: true
  validates :item_status, presence: true
  validates :price, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_method, presence: true
  validates :prefecture, presence: true
  validates :delivery_date, presence: true
  validates :images, presence: true
end
