# テーブル設計

## usersテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false, |
| email              | string | null: false, |
| encrypted_password | string | null: false, |
| last_name          | string | null: false, |
| first_name         | string | null: false, |
| last_name_reading  | string | null: false, |
| first_name_reading | string | null: false, |
| birthday           | date   | null: false, |



### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false,                   |
| explanation        | text       | null: false,                   |
| category_id        | integer    | null: false,                   |
| status_id          | integer    | null: false,                   |
| delivery_charge_id | integer    | null: false,                   |
| shipping_area_id   | integer    | null: false,                   |
| shipping_days_id   | integer    | null: false,                   |
| price              | integer    | null: false,                   |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user_id | references | null: false, foreign_key: true|
| item_id | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipmentsテーブル
| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| postal_code      | string  | null: false,                   |
| shipping_area_id | integer | null: false,                   |
| municipality     | string  | null: false,                   |
| address          | string  | null: false,                   |
| building_name    | string  |                                |
| phone_number     | string  | null: false,                   |

### Association

- belongs_to :purchase
