require 'spec_helper'

feature 'User can add gift links to list'do
  scenario 'User can add a gift url and nickname to list'do
    visit '/'

    fill_in 'gift_nickname', with: 'Awesome bag!'
    fill_in 'gift_url', with: 'www.example.com'
    click_on 'Add Item!'

    expect(page).to have_content 'Awesome bag!'
    expect(page).to have_content 'www.example.com'

  end
end