FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"赤星"}
    first_name {"玄弥"}
    kana_last_name {"アカボシ"}
    kana_first_name {"ゲンヤ"}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end