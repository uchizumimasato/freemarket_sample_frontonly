# usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|name_kana|string|null: false, unique: true|
|profile|text||
|evaluation|interger||
|birthday|datetime|null: false|
|postal_code|interger||
|prefecture|string||
|city|string||
|address|interger||
|building_name|string||

## Association
- has_many :items
- has_many :points
- has_many :todos
- has_many :notifications
- has_many :likes
- has_many :sales
- has_many :likes
- has_many :item_users
- has_many :items, through: item_users

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|status|string||
|price|interger|null: false|
|item_status|string|null: false|
|size|string||
|delivery_fee|string|null: false|
|delivery_method|string|null: false|
|prefecture|interger|null: false|
|delivery_date|inerger|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|

## Association
- has_many :likes
- has_many :item_users
- has_many :users, through: :item_users
- belongs_to :user
- belongs_to :category
- belongs_to :brand

# item_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|exhibition_status|string||
|purchase_status|string||

# categorysテーブル
## 経路列挙型で実装
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|ancestry|string|nul: false|

## Association
- has_many :items

# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

## Association
has_many :items

# todosテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :user

# notificationsテーブル
|Column|Type|Options|
|------|----|-------|
|contents|text||
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :user

# newsテーブル
|Column|Type|Options|
|------|----|-------|
|contents|text||

# likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :item

# pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user

# salesテーブル
|Column|Type|Options|
|------|----|-------|
|sales|interger||
|sales_history|interger||
|user_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user

# その他
## Active_hashで実装
- 都道府県
- 配送方法

## Active_storageで実装
- 画像

