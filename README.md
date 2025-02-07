## usersテーブル

|Column                |Type   |Options                   |
|----------------------|-------|--------------------------|
|nickname              |string |null: false               |
|email                 |string |null: false, unique: true |
|encrypted_password    |string |null: false               |
|first_name            |string |null: false               |
|last_name             |string |null: false               |
|kana_first            |string |null: false               |
|kana_last             |string |null: false               |
|birth                 |date   |null: false               |

### Association
-has_many :items
-has_many :buys

## itemsテーブル

|Column                |Type     |Options     |
|----------------------|----------|------------|
|product_name          |string    |null: false |
|product_description   |text      |null: false |
|category_id           |integer   |null: false |
|product_condition_id  |integer   |null: false |
|shipping_fee_id       |integer   |null: false |
|region_id             |integer   |null: false |
|shipping_day_id       |integer   |null: false |
|price                 |integer   |null: false |
|user                  |references|null: false, foreign_key: true|


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

|Column                |Type      |Options     |
|----------------------|----------|------------|
|post_code             |string    |null: false |
|region_id             |integer   |null: false |
|city                  |string    |null: false |
|street_address        |string    |null: false |
|building_name         |string    |            |
|telephone             |string    |null: false |
|buys                  |references|null: false, foreign_key: true|

### Association
-belongs_to :buy