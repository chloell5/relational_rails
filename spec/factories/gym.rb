FactoryBot.define do
  factory :gym, class: Gym do
    #name {["Fitness and Yoga", "Yoga Olas", "Rec Center of the Rockies", "BV Dance Studio", "Local Gym"].sample}
    name {[Faker::Company.name].uniq.sample}
    location {Faker::Address.city}
    open {Faker::Boolean.boolean}
    rank {Faker::Number.between(from: 1, to: 20)}

  end
end
