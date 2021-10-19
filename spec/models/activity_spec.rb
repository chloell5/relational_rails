require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'relationships' do
    it {should belong_to :gym}
  end

  describe 'class methods' do
    it 'only shows drop in true records' do
      gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
      time = Time.new(2021, 4, 2)

      activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
      activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
      activity_3 = Activity.create!(name: 'Cardio', day: 'Saturday', time: '10:15', max_number: 5, drop_in: false, gym_id: gym_1.id)

      expect(Activity.drop_in_true).to eq([activity_1, activity_2])

    end

    it 'can sort activities alphabetically' do
      gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
      time = Time.new(2021, 4, 2)

      activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
      activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
      activity_3 = Activity.create!(name: 'Cardio', day: 'Saturday', time: '10:15', max_number: 5, drop_in: false, gym_id: gym_1.id)

      expect(Activity.sort_alphabetically).to eq(['Cardio', 'Intensity Train', 'Yoga'])
    end
  end
end
