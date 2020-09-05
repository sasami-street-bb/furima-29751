# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| description   | text    | null: false |
| price         | integer | null: false |
| category_id      | integer | null: false |
| condition_id     | integer | null: false |
| shipping_fee_id  | integer | null: false |
| prefectur_id     | integer | null: false |
| shipping_date_id | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order_id      | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefectur_id  | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :order
- belongs_to_active_hash :prefectur