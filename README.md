# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column                    | Type       | Options                        |
| ---------------------     | ---------- | ------------------------------ |
| title                     | string     | null: false                    |
| description               | text       | null: false                    |
| category_id               | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| burden_id                 | integer    | null: false                    |
| area_id                   | integer    | null: false                    |
| delivery_day_id           | integer    | null: false                    |
| price                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to   :user
- belongs_to   :item
- has_one      :address

## addressesテーブル

| Column                      | Type       | Options                    |
| --------------------------- | -------    | -------------------------- |
| postal                      | string     | null: false                |
| prefecture_id               | integer    | null: false                |
| municipality                | string     | null: false                |
| address                     | string     | null: false                |
| building                    | string     | -------------------------- |
| phone_number                | string     | null: false                |
| order                       | references | null: false, foreign: true |

### Association

- belongs_to :order