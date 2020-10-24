class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
             
  has_many :items
  has_many :comments
  has_many :purchases
  
  
  validates :nickname,              presence: true
  validates :password,              presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,12}+\z/i, message:' Include both letters and numbers'}
  validates :last_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_furigana,   presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_furigana,    presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birthday,              presence: true
  

end
