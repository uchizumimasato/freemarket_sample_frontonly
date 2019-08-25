class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string     :name, null: false, index: true              # 商品名
      t.text       :description, null: false                    # 商品の説明
      t.integer    :item_status, null: false                    # 商品の状態
      t.integer    :delivery_fee, null: false                   # 配送料の負担
      t.integer    :delivery_method_id, null: false             # 配送の方法
      t.integer    :delivery_date, null: false                  # 配送料までの日数
      t.integer    :prefecture_id, null: false                  # 都道府県
      t.integer    :price, index: true, null: false             # 商品の値段
      t.string     :size                                        # 商品のサイズ
      t.integer    :transaction_status, null: false, default: 0 # 取引状況
      t.integer    :seller_id, null: false, foreign_key: true   # 売り手のid
      t.integer    :buyer_id                                    # 買い手のid
      t.integer    :category_id, null: false, foreign_key: true # カテゴリーのid
      t.integer    :brand_id                                    # ブランドのid
      t.timestamps
    end
  end
end
