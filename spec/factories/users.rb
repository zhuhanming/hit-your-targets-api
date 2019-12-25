FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
    display_image_url { '' }
  end
end