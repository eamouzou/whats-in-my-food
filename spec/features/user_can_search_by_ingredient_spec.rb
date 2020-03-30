require 'rails_helper'


feature 'user can search for foods with given ingredient' do

  scenario 'user inputs valid food ingredient name' do

    visit '/'
    fill_in :q, with: "sweet potatoes"

    click_button 'Search'
    expect(current_path).to eq('/foods')
    expect(page).to have_content('Total Number of Matching Foods: 26412')
    expect(page).to have_content('Top 10 Foods Containing Sweet Potatoes')
    expect(page).to have_css('.food', count: 10)
  
    within(first('.food')) do
      expect(page).to have_css('.code')
      expect(page).to have_content('728229015529')
      expect(page).to have_css('.description')
      expect(page).to have_content('REAL VEGETABLE CHIPS')
      expect(page).to have_css('.owner')
      expect(page).to have_content('The Hain Celestial Group, Inc.')
      expect(page).to have_css('.ingredients')
      expect(page).to have_content('A BLEND OF SWEET POTATOES (SWEET POTATO, PURPLE SWEET POTATO, BATATA), AVOCADO OIL, SEA SALT.')
    end
  end
end
