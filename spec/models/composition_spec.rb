require 'rails_helper'

RSpec.describe Composition, type: :model do
  describe 'relationships' do
    it { should belong_to :museum }
  end

  describe 'methods' do
    it 'can filter by minimum created year' do
      museum = Museum.create!(
        name: 'The Louvre',
        free_admission: false,
        donation_revenue: 12_345_678
      )

      comp = Composition.create!(
        name: 'The Starry Night',
        artist: 'van Gogh',
        on_display: true,
        year_made: 1889,
        museum_id: museum.id
      )

      comp2 = Composition.create!(
        name: 'The Boulevard Montmarte in Paris',
        artist: 'Pissarro',
        on_display: false,
        year_made: 1897,
        museum_id: museum.id
      )

      comp3 = Composition.create!(
        name: 'Thatched Cottages and Houses',
        artist: 'van Gogh',
        on_display: true,
        year_made: 1890,
        museum_id: museum.id
      )

      comp4 = Composition.create!(
        name: 'The Return of the Prodigal Son',
        artist: 'Rembrandt',
        on_display: true,
        year_made: 1889,
        museum_id: museum.id
      )

      expect(museum.compositions.over_year(1890)).to eq([comp2, comp3])
    end
  end
end
