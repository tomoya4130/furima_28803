# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| name_read | string  | null: false |
| birthday  | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| shipping_fee_burden | string     | null: false                    |
| shipping_region     | string     | null: false                    |
| days_until_shipping | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

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
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase