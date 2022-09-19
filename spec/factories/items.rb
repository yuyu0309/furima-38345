FactoryBot.define do
  factory :item do
    item_name { '商品名' }
    explanation { '商品の説明' }
    category_id { '2' }
    situation_id { '3' }
    shipping_charge_id { '3' }
    prefecture_id { '10' }
    delivery_date_id { '3' }
    price { '612' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end
  end
end
