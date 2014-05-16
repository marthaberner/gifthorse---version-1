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

    expect(page).to have_content 'Hello, Martha!'

    click_on 'Logout'
    expect(page).to have_content 'You are logged out'

  end

  scenario 'Username cannot be blank' do
    visit '/'

    within '.create_account' do
      fill_in 'Username', with: ''
      fill_in 'Password', with: '1234'
      click_on 'Create Account'
    end
    expect(page).to have_content 'Username cannot be blank'
  end

  scenario 'Password cannot be blank' do
    visit '/'

    within '.create_account' do
      fill_in 'Username', with: 'Hunter'
      fill_in 'Password', with: ''
      click_on 'Create Account'
    end
    expect(page).to have_content 'Password can\'t be blank'
  end

  scenario 'Password must be between min 4 characters ' do
    visit '/'

    within '.create_account' do
      fill_in 'Username', with: 'Hunter'
      fill_in 'Password', with: '12'
      click_on 'Create Account'
    end
    expect(page).to have_content 'Password is too short (minimum is 4 characters)'
  end
end