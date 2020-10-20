# テーブル設計

## users テーブル

| Column     | Type      | Options     |
| --------   | ------    | ----------- |
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| name       | text      | null: false |
| birthday   | integer   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column       | Type      | Options     |
| -----------  | --------- | ----------- |
| item name    | string    | null: false |
| description  | text      | null:false  | 
| condition    | text      | null:false  |
| category     | text      | null:false  |
| shipping cost| text      | null:false  |
| price        | integer   | null:false  |
| days to ship | integer   | null:false  |
| ship from    | text      | null:false  |
| user         | reference | null:false, foreign_key: true|

### Association

- belong_to: user
- has_many :comments
- has_one :order

## comments テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| text         | text       | null:false                     |
| user         | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| payments       | integer    | null:false                     |
| address        | string     | null:false                     |
| card info      | integer    | null:false                     |
| expiration dat | integer    | null:false                     |
| security code  | integer    | null:false                     |
| phone number   | integer    | null:false                     |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item