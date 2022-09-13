# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name_chinese       | string | null: false |
| name_katakana      | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |
| category         | string     | null: false                    |
| situation        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_origin  | string     | null: false                    |
| delivery_date    | string     | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase



## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item



## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item