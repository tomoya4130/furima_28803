FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    ruby_last_name        { 'ヤマダ' }
    ruby_first_name       { 'タロウ' }
    birthday              { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
