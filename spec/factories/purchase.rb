FactoryBot.define do
  factory :purchase do
    post_code { '123-4567' }
    prefecture_id { '12' }
    municipality { '横浜市緑区' }
    address { '青山1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
