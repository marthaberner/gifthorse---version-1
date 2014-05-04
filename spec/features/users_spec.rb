require 'spec_helper'

feature 'User Accounts' do
  scenario 'user can register' do
    visit '/'

    within '.create_account' do
      fill_in 'Username', with: 'martha'
      fill_in 'Password', with: 'me'
      click_on 'Create Account'
    end

    visit '/'

    within '.sign_in' do
      fill_in 'Username', with: 'martha'
      fill_in 'Password', with: 'me'
      click_on 'Sign In'
    end

    expect(page).to have_content 'Welcome, martha'
  end
end