FactoryBot.define do
  factory :activity, class: Activity do
    name {["Yoga", "Barre", "Intensity Train", "Power Yoga", "Cardo"].sample}
    day {["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"].sample}
    time {Faker::Time.between(from: DateTime.now, to: DateTime.now + 30)}
    max_number {Faker::Number.between(from: 10, to: 20)}
    drop_in {Faker::Boolean.boolean}
    association :gym
    #gym_id {Faker::Number.between(from: 1, to: 5)}

  end
end
