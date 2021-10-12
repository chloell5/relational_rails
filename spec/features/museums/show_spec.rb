require 'rails_helper'

describe 'museums show page' do
  before(:each) do
    @museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )

    visit "/museums/#{@museum.id}"
  end

  it 'has museum attributes' do
    expect(page).to have_content(@museum.name)
    expect(page).to have_content("Free admission?: #{@museum.free_admission}")
    expect(page).to have_content("Donation Revenue: $#{@museum.donation_revenue}")
  end
end
