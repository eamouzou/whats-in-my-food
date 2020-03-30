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
    expect(page).to
    # Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
    # And for each of the foods I should see:
    # - The food's GTIN/UPC code
    # - The food's description
    # - The food's Brand Owner
    # - The food's ingredients
  end
end
