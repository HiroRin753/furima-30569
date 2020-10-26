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

    with_options numericality: { other_than: 1 } do
      validates :condition_id 
      validates :category_id
      validates :shipping_cost_id
      validates :days_to_ship_id
      validates :ship_from_id
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :ship_from

end
