FactoryBot.define do
  factory :purchase_address do
    token { 'tok_f84a49e089b52e2696cfdb16c8d6' }
    postal_code { '090-0000' }
    prefecture_id { '1' }
    city { Faker::Address.city }
    house_number { Faker::Address.street_name }
    building { Faker::Address.building_number }
    phone_number { '09012345678' }
  end
end
