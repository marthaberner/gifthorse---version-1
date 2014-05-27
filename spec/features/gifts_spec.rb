require 'spec_helper'

feature 'Gifts' do
  scenario 'User can add an item to their list' do
    visit '/'

    within '.create-home' do
      fill_in 'Email', with: 'martha@example.com'
      fill_in 'Password', with: '12345678'
      click_on 'Create Account'
    end

    fill_in 'gift[nickname]', with: 'Awesome Bag!'
    fill_in 'gift[url]', with: 'gift@example.com'
    click_on 'Add Item'

    expect(page).to have_content 'Awesome Bag!'
    expect(page).to have_content 'gift@example.com'

    click_link 'Back to my list'

    expect(page).to have_content 'Awesome Bag!'
    expect(page).to have_content 'gift@example.com'
  end
end