FactoryBot.define do
  factory :purchase_shipment do
    postal_code { '123-4567' }
    shipping_area_id {4}
    municipality {'大山市'}
    address {'犬田3-3-3'}
    building_name {'柳ビル'}
    phone_number {'08022222222'}
    association :user
    association :item
    
  end
end
