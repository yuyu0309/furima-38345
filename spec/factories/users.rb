FactoryBot.define do
  factory :user do
    #transient do
    #  person { Gimei.name }
    #end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number:6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name            {Gimei.first.kanji}
    last_name             {Gimei.last.kanji}
    first_name_kana       {Gimei.first.katakana}
    last_name_kana        {Gimei.last.katakana}
    birthday              {Faker::Date.birthday}
  end
end