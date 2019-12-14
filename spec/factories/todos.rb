FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    start_time { Faker::Time.backward(days: 3, period: :evening) }
    end_time { Faker::Time.forward(days: 3, period: :morning) }
    completed { false }
    user_id { nil }
  end
end