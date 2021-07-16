FactoryBot.define do
  factory :user do
    nickname { 'たなか' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '龍太郎' }
    last_name_reading { 'タナカ' }
    first_name_reading { 'リュウタロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
