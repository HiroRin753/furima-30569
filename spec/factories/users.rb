FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6, max_length: 12, mix_case: true)}
    password_confirmation {password}
    last_name  {person.last.kanji} 
    first_name {person.first.kanji}
    last_name_furigana {person.last.katakana}
    first_name_furigana {person.first.katakana}
    birthday {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end