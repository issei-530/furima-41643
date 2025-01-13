## usersテーブル

|Column                |Type   |Options                   |
|----------------------|-------|--------------------------|
|nickname              |string |null: false               |
|email                 |string |null: false, unique: true |
|encrypted_password    |string |null: false               |
|password_confirmation |string |null: false               |
|name                  |string |null: false               |
|kana_name             |string |null: false               |
|birth                 |string |null: false               |

### Association
-has_many :items
-has_many :buys

## itemsテーブル

|Column                |Type   |Options     |
|----------------------|-------|------------|
|product_name          |string |null: false |
|product_description   |text   |null: false |
|category              |string |null: false |
|product_condition     |string |null: false |
|shipping_fee          |string |null: false |
|region                |string |null: false |
|days                  |string |null: false |
|price                 |integer|null: false |


### Association
-has_one :buy
-belongs_to :user

## buysテーブル

|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|user                  |references |null: false, foreign_key: true |
|item                  |references |null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :item
-has_one :destination

## destinationsテーブル

|Column                |Type   |Options     |
|----------------------|-------|------------|
|post_code             |string |null: false |
|prefecturs            |string |null: false |
|cuty                  |string |null: false |
|street_address        |string |null: false |
|building_name         |string |            |
|telephone             |integer|null: false |

### Association
-belongs_to :buy