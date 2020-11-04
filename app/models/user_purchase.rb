class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :purchase_id, :user_id, :item_id, :token, :price
  
 with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :house_number, format: { with: /\A[ぁ-んァ-ン一-龥0-9]/ }
  validates :phone,        numericality: { with: /\A\d{10,11}\z/ }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :token
 end
 
 def save
  purchase = Purchase.create(user_id: user_id, item_id: item_id)
  Address.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone)
 end
end