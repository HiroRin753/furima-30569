FactoryBot.define do
  factory :item do
    name {Faker::Name.name(40)}
    price {Faker::Number.within(range: 300..9999999)}
    description {Faker::String.random(length: 1000)} 
    # condition_id
    # category_id
    # shipping_codt_id
    # days_to_ship_id
    # ship_from_id
   
  
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
