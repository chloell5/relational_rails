require 'rails_helper'

describe 'museums index page' do
  before(:each) do
    @museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12345678
    )
    @museum2 = Museum.create!(
      name: 'MOMA',
      free_admission: true,
      donation_revenue: 7654321
    )

    visit '/museums'
  end

  it 'shows all museum names' do
    expect(page).to have_content(@museum.name)
    expect(page).to have_content(@museum2.name)
  end

  it 'shows all museums by most recently created' do
    expect(@museum2.name).to appear_before(@museum.name)
  end

  it 'shows created by datetime' do
    expect(page).to have_content(@museum.created_at)
    expect(page).to have_content(@museum2.created_at)
  end
end
