require 'rails_helper'

describe 'compositions index page' do
  before(:each) do
    @museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )
    @museum2 = Museum.create!(
      name: 'MOMA',
      free_admission: true,
      donation_revenue: 7_654_321
    )

    @comp = Composition.create!(
      name: 'Mona Lisa',
      artist: 'da Vinci',
      on_display: true,
      year_made: 1503,
      museum_id: @museum.id
    )

    @comp2 = Composition.create!(
      name: 'The Persistence of Memory',
      artist: 'Dali',
      on_display: false,
      year_made: 1931,
      museum_id: @museum2.id
    )

    visit "/compositions/#{@comp.id}"
  end

  it 'has composition attributes' do
    expect(page).to have_content(@comp.name)
    expect(page).to have_content("Artist: #{@comp.artist}")
    expect(page).to have_content("On Display?: #{@comp.on_display}")
    expect(page).to have_content("Year Made: #{@comp.year_made}")

    expect(page).to_not have_content(@comp2.name)
    expect(page).to_not have_content("Artist: #{@comp2.artist}")
    expect(page).to_not have_content("On Display?: $#{@comp2.on_display}")
    expect(page).to_not have_content("Year Made: #{@comp2.year_made}")
  end

  it 'has update button' do
    click_link 'Update Composition'

    expect(page).to have_current_path("/compositions/#{@comp.id}/edit")
  end

  it 'has delete functionality' do
    click_on 'Delete Composition'

    expect(page).to_not have_content('The Mona Lisa')
  end
end
