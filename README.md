# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| category           | integer    | null: false                    |
| status             | integer    | null: false                    |
| burden             | integer    | null: false                    |
| area               | integer    | null: false                    |
| days               | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## ordersテーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| information        | integer    | null: false |
| date               | integer    | null: false |
| code               | integer    | null: false |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :items
- has_one    :address

## addressesテーブル

| Column             | Type       | Options                    |
| ------------------ | -------    | -------------------------- |
| postal             | integer    | null: false                |
| prefecture         | integer    | null: false                |
| municipality       | string     | null: false                |
| address            | string     | null: false                |
| building           | string     | -----------                |
| number             | integer    | null: false                |
| order              | references | null: false, foreign: true |

### Association

- belongs_to :order