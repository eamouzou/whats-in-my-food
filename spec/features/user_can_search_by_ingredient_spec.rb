require 'rails_helper'


feature 'user can search for foods with given ingredient' do

  scenario 'user inputs valid food ingredient name' do
    # As a user,
    # When I visit "/"
    visit '/'
    # And I fill in the search form with "sweet potatoes"
    fill_in :q, with: "sweet potatoes"
    # (Note: Use the existing search form)
    # And I click "Search"
    click_button 'Search'
    # Then I should be on page "/foods"
    expect(current_path).to eq('/foods')
    # Then I should see a total of the number of items returned by the search.
    expect(page).to have_content('Total Number of Matching Foods: 26412')
    # Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
    expect(page).to have_content('Top 10 Foods Containing Sweet Potatoes')
    expect(page).to have_css('.food', count: 10)
    # And for each of the foods I should see:
    # - The food's GTIN/UPC code
    # - The food's description
    # - The food's Brand Owner
    # - The food's ingredients
    within(first('.food')) do
      expect(page).to have_css('GTIN/UPC code')
      expect(page).to have_content('728229015529')
      expect(page).to have_css('description')
      expect(page).to have_content('REAL VEGETABLE CHIPS')
      expect(page).to have_css('Brand Owner')
      expect(page).to have_content('The Hain Celestial Group, Inc.')
      expect(page).to have_css('ingredients')
      expect(page).to have_content('A BLEND OF SWEET POTATOES (SWEET POTATO, PURPLE SWEET POTATO, BATATA), AVOCADO OIL, SEA SALT.')
    end
  end
end
