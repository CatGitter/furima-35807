FactoryBot.define do
  factory :order_address do
    postal { '123-4567' }
    prefecture_id { 2 }
    municipality { 'テスト市テスト町' }
    address { '0-0-0' }
    building { 'テストコーポ101' }
    phone_number {Faker::Number.leading_zero_number(digits: 10)}
    token { "tok_abcdefghijk00000000000000000" }
  end
end
