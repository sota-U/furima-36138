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

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false,                   |
| explanation     | string     | null: false,                   |
| category        | string     | null: false,                   |
| status          | string     | null: false,                   |
| delivery_charge | string     | null: false,                   |
| shipping_area   | string     | null: false,                   |
| shipping_days   | string     | null: false,                   |
| price           | date       | null: false,                   |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases

## purchasesテーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user_id | references | null: false, foreign_key: true|
| item_id | references | null: false, foreign_key: true|

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipments

## shipmentsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer(7) | null: false,                   |
| prefectures     | string     | null: false,                   |
| municipality    | string     | null: false,                   |
| address         | string     | null: false,                   |
| building_name   | string     |                                |
| phone_number    | integer    | null: false,                   |

### Association

- belongs_to :shipments
