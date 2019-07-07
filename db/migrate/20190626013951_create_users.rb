class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string     :name, null: false, unique: true, index: true # ユーザー名
      t.string     :name_kana, null: false, unique: true         # ユーザー名カナ
      t.string     :email, null: false, unique: true             # メールアドレス
      t.string     :password_digest, null: false                 # パスワード
      t.text       :profile                                      # 自己紹介文
      t.integer    :evalation                                    # 評価
      t.datetime   :birthday                                     # 生年月日
      t.string     :postal_code                                  # 郵便番号
      t.string     :prefecture                                   # 都道府県
      t.string     :city                                         # 市区町村
      t.string     :address                                      # 番地
      t.string     :buildint_name                                # 建物名
      t.timestamps
    end
  end
end
