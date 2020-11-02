class UserPurchase
  include ActiveModel::Model
  attr_accessor :number, :month, :year, :security_code, :postal_code, :prefecture, :city, :house_number, :building_name, :phone
  
 with_options presence: true do
  validates :number, format: { with; /\A[0-9]{12}+\z/}
  validates :month, format: { with; /\A[0-9]{1}+\z/}
  validates :year, format: { with; /\A[0-9]{2}+\z/}
  validates :security_code, format: { with; /\A[0-9]{3,4}+\z/}
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city,        format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :house_number, format:{ with: /\A[ぁ-んァ-ン一-龥0-9]/}
  validates :phone, format: {with:/\A\d{11}\z/}
 end
 
 validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

 def save
  card = Card.create(number: number, month: month, year: year, security_code: security_code)
  Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone: phone, user_id: user.id)
 end
end