require 'rails_helper'

RSpec.describe Museum, type: :model do
  describe 'relationships' do
    it { should have_many :compositions }
  end

  describe 'methods' do
    before(:each) do
      @museum = Museum.create!(
        name: 'The Louvre',
        free_admission: false,
        donation_revenue: 12_345_678
      )

      @comp = Composition.create!(
        name: 'The Starry Night',
        artist: 'van Gogh',
        on_display: true,
        year_made: 1889,
        museum_id: @museum.id
      )

      @comp2 = Composition.create!(
        name: 'Mona Lisa',
        artist: 'da Vinci',
        on_display: true,
        year_made: 1503,
        museum_id: @museum.id
      )

      @comp3 = Composition.create!(
        name: 'The Persistence of Memory',
        artist: 'Dali',
        on_display: true,
        year_made: 1931,
        museum_id: @museum.id
      )
    end

    it 'counts compositions' do
      expect(@museum.count).to eq(3)
    end

    it 'organizes compositions in order by name' do
      expect(@museum.order_compositions).to eq([@comp2, @comp3, @comp])
    end
  end
end
