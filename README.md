# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| ruby_last_name  | string  | null: false |
| ruby_first_name | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| image                  | string     | null: false                    |
| name                   | string     | null: false                    |
| text                   | text       | null: false                    |
| category_id            | string     | null: false                    |
| status_id              | string     | null: false                    |
| shipping_fee_burden_id | string     | null: false                    |
| shipping_region_id     | string     | null: false                    |
| days_until_shipping_id | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
 
## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures_id   | string     | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase