class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :ship_from
  
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_one :purchase
  
  with_options presence: true do
    validates :name
    validates :image
    validates :price, format: { with: /\A[0-9]{}+\z/, message: 'Out of setting range'}, 
                      numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
    validates :description
    
    with_options numericality: { other_than: 1 } do
       validates :condition_id
       validates :category_id
       validates :shipping_cost_id
       validates :days_to_ship_id
       validates :ship_from_id
    end
  end
end



# // https://gyazo.com/fe0eea8fce4a9692ed7d1ee8bc897e46