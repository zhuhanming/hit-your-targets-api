FactoryBot.define do
  factory :subtodo do
    title { Faker::Lorem.word }
    start_time { Faker::Time.backward(days: 3, period: :evening) }
    end_time { Faker::Time.forward(days: 3, period: :morning) }
    completed { false }
    todo_id { nil }
  end
end