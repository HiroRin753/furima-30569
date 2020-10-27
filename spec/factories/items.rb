FactoryBot.define do
  factory :item do
    name {Faker::Name.name(40)}
    description {Faker::String.random(length: 1000)} 
    condition_id { rand(2..7)}
    category_id { rand(2..11)}
    shipping_codt_id { rand(2..3)}
    days_to_ship_id { rand(2..4)}
    ship_from_id { rand(2..48)}
    price {rand( 300..9999999)}
    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
