FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.images.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
    name { Faker::Name.initials(number: 2) }
    text { Faker::Lorem.sentence }
    price { Faker::Number.number(digits: 5) }
    category_id {"1"}
    status_id {"1"}
    shipping_fee_burden_id {"1"}
    shipping_region_id {"1"}
    days_until_shipping_id {"1"}
    user
  end
end
