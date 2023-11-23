FactoryBot.define do
  factory :favorite_restaurant do
    association :user

    restaurant_id { 'ChIJDXRaF-7Jj4ARP7pAVdmdxH4' }
  end
end
