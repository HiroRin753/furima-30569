# テーブル設計

## users テーブル
| Column     | Type      | Options     |
| --------   | ------    | ----------- |
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| first-name | string      | null: false |
| last-name  | string      | null: false |
| furigana(F) | string      | null: false |
| furigana(L) | string      | null: false |
| birthday   | date      | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :orders
- has_many :deal


## items テーブル
| Column       | Type      | Options     |
| -----------  | --------- | ----------- |
| name         | string    | null: false |
| description  | text      | null:false  | 
| condition    | integer_id   | null:false  |
| category     | integer_id   | null:false  |
| shipping cost| integer_id   | null:false  |
| price        | integer   | null:false  |
| days to ship | integer_id   | null:false  |
| ship from    | integer_id   | null:false  |
| user         | reference | null:false, foreign_key: true|

### Association
- belongs_to: user
- has_many :comments
- has_one :order
- has_one :deal

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
- has_one :deal


## deal テーブル
| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :order