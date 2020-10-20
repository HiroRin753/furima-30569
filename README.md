# テーブル設計

## users テーブル
| Column     | Type      | Options     |
| --------   | ------    | ----------- |
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| first-name | text      | null: false |
| last-name  | text      | null: false |
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
| condition    | integer   | null:false  |
| category     | integer   | null:false  |
| shipping cost| integer   | null:false  |
| price        | integer   | null:false  |
| days to ship | integer   | null:false  |
| ship from    | integer   | null:false  |
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


## deal テーブル
| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item