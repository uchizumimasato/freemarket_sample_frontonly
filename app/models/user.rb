class User < ApplicationRecord
  has_secure_password

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
