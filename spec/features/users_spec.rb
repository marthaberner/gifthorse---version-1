require 'spec_helper'

feature 'User Accounts' do
  scenario 'user can register' do
    visit '/'

    within '.create_account' do
      fill_in 'Username', with: 'martha'
      fill_in 'Password', with: 'meee'
      click_on 'Create Account'
    end

    visit '/'

    within '.login' do
      fill_in 'Username', with: 'martha'
      fill_in 'Password', with: 'meee'
      click_on 'Login'
    end

    expect(page).to have_content 'Hello'
  end
end