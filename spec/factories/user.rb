FactoryBot.define do
  factory :user do
    nickname { 'たなか' }
    email { Faker::Internet.free_email }
    password = '6t6a6n6a6k6a6'
    password { password }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '龍太郎' }
    last_name_reading { 'タナカ' }
    first_name_reading { 'リュウタロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
