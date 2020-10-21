# テーブル設計

## users テーブル
| Column     | Type      | Options     |
| --------   | ------    | ----------- |
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| first_name | string      | null: false |
| last_name  | string      | null: false |
| first_name_furigana | string      | null: false |
| last_name_furigana| string      | null: false |
| birthday   | date      | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル
| Column           | Type      | Options     |
| ---------------  | --------- | ----------- |
| name             | string    | null: false |
| description      | text      | null:false  | 
| condition_id     | integer   | null:false  |
| category_id      | integer   | null:false  |
| shipping_cost_id | integer   | null:false  |
| days_to_ship_id  | integer   | null:false  |
| ship_from_id     | integer   | null:false  |
| price            | integer   | null:false  |
| user             | references | null:false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comment
- has_one :purchase

## comments テーブル
| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| text         | text       | null:false                     |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## purchases テーブル
| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル
| Column         | Type       | Options     |
|--------------- | ---------  | ----------  |
| phone_number   | string     | null:false  |
| postcode       | string     | null:false  |
| prefecture_id  | integer    | null:false  |
| city           | string     | null:false  |
| banchi         | string     | null:false  |
| building_name  | string     | 
| purchase       | references |null: false, foreign_key: true|


#### Association
- belongs_to :purchase