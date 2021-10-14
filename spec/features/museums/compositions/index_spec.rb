require 'rails_helper'

describe 'museum compositions index page' do
  it 'has museum composition attributes' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12345678
    )
    museum2 = Museum.create!(
      name: 'MOMA',
      free_admission: true,
      donation_revenue: 7654321
    )

    comp = Composition.create!(
      name: 'Mona Lisa',
      artist: 'da Vinci',
      on_display: true,
      year_made: 1503,
      museum_id: museum.id
    )

    comp2 = Composition.create!(
      name:'The Persistence of Memory',
      artist:'Dali',
      on_display: false,
      year_made: 1931,
      museum_id: museum2.id
    )

    visit "/museums/#{museum.id}/compositions"

    expect(page).to have_content(museum.name)
    expect(page).to have_content(comp.name)
    expect(page).to have_content("Artist: #{comp.artist}")
    expect(page).to have_content("On Display?: #{comp.on_display}")
    expect(page).to have_content("Year Made: #{comp.year_made}")

    expect(page).to_not have_content(museum2.name)
    expect(page).to_not have_content(comp2.name)
    expect(page).to_not have_content("Artist: #{comp2.artist}")
    expect(page).to_not have_content("On Display?: #{comp2.on_display}")
    expect(page).to_not have_content("Year Made: #{comp2.year_made}")
  end
end
