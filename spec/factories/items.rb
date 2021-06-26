FactoryBot.define do
  factory :item do
    title {Faker::Name.name}
    description {Faker::Lorem.sentence}
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    prefecture_id { 2 }
    delivery_day_id{ 2 }
    price {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test1_image.png'), filename: 'test1.image_png')
    end
  end
end
