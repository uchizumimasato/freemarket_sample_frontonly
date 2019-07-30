class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id'
  has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id'

  validates :nickname, presence: true
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
