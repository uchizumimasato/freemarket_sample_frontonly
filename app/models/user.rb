class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id'
  has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_one :card

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

  def self.from_omniauth(auth)
    user_new = User.create(nickname: auth.info.name, email: auth.info.email, password: '00000000', password_confirmation: '00000000', name: '', name_kana: '')
    user_new.save :validate => false
    user = User.last
    sns = SnsCredential.create(provider: auth.provider, uid: auth.uid, user_id: user.id)
    return user
  end
end
