FactoryBot.define do
  factory :gym, class: Gym do
    name {["Peak Fitness", "Yoga Olas", "Yoga Tonic", "BV Dance Studio", "Local Gym"].sample}
    location {Faker::Address.city}
    open {Faker::Boolean.boolean}
    rank {Faker::Number.between(from: 1, to: 20)}

  end
end
