class Item < ApplicationRecord
  # enum
  enum transaction_status: [:buy, :trade, :selled]
  enum delivery_fee: ["送料込み（出品者負担）", "着払い（購入者負担）"]
  enum item_status: ["新品/未使用", "未使用に近い", "目立った傷や汚れなし", "やや傷や汚れなし", "傷や汚れなし", "状態が悪い"]
  enum delivery_date: ["1-2日で発送", "2-3日で発送", "4-7日で発送"]

  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many_attached :images
  belongs_to :category
  belongs_to :brand
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  # バリデーション
  validates :name, presence: true
  validates :description, presence: true
  validates :item_status, presence: true
  validates :price, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_method, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_date, presence: true
  validates :images, presence: true
end
