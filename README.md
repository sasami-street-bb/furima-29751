# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| description   | text    | null: false |
| image         | string  | null: false |
| price         | integer | null: false |
| category_id      | integer | null: false |
| condition_id     | integer | null: false |
| shipping_fee_id  | integer | null: false |
| ship_from_id     | integer | null: false |
| shipping_date_id | integer | null: false |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one : address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order_id      | references | null: false, foreign_key: true |
| postal_code   | integer    | null: false                    |
| prefectur     | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |

### Association

- belongs_to :orders