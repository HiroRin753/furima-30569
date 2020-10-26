class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :image
    validates :price
    validates :description
    validates :condition_id 
    validates :category_id
    validates :shipping_cost_id
    validates :days_to_ship_id
    validates :ship_from_id
    
  end
end
