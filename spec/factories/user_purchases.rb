FactoryBot.define do
  factory :user_purchase do
    user_id {rand(1..9999999)}
    item_id {rand(1..9999999)}
    postal_code { '123-4567' }
    prefecture_id { rand(2..48)}
    city { '横浜市' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone {rand(99999999999)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
