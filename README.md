# テーブル設計

## users テーブル
| Column     | Type      | Options     |
| --------   | ------    | ----------- |
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| first-name | string      | null: false |
| last-name  | string      | null: false |
| first_name_furigana | string      | null: false |
| last_name_furigana| string      | null: false |
| birthday   | date      | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchase


## items テーブル
| Column           | Type      | Options     |
| ---------------  | --------- | ----------- |
| name             | string    | null: false |
| description      | text      | null:false  | 
| condition_id     | integer   | null:false  |
| category_id      | integer   | null:false  |
| shipping cost_id | integer   | null:false  |
| days to ship_id  | integer   | null:false  |
| ship from_id     | integer   | null:false  |
| price            | integer   | null:false  |
| user             | reference | null:false, foreign_key: true|

### Association
- belongs_to: user
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
- belongs_to : user
- belongs_to :item
- has_one :address



## addressテーブル
| Column         | Type       | Options     |
|--------------- | ---------  | ----------  |
| phone number   | integer    | null:false  |
| postcode       | integer    | null:false  |
| prefecture     | integer    | null:false  |
| city           | string     | null:false  |
| banchi         | string     | null:false  |
| building_name  | string     | null:true   |
| phone_number   | integer    | null:false  |

#### Association
- belongs_to :purchase