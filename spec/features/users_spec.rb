require 'spec_helper'

feature 'User Accounts' do
  scenario 'user can register' do
    visit '/'

    within '.create_account' do
      fill_in 'Email', with: 'martha@example.com'
      fill_in 'Password', with: '12345678'
      click_on 'Create Account'
    end

    click_on 'Logout'
    expect(page).to have_content 'Signed out successfully'

    within '.login' do
      fill_in 'Email', with: 'martha@example.com'
      fill_in 'Password', with: '12345678'
      click_on 'Login'
    end

    expect(page).to have_content 'Hello, martha@example.com!'
  end

  scenario 'Email cannot be blank' do
    visit '/'

    within '.create_account' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: '12345678'
      click_on 'Create Account'
    end
    expect(page).to have_content 'Email can\'t be blank'
  end

  scenario 'Password cannot be blank' do
    visit '/'

    within '.create_account' do
      fill_in 'Email', with: 'Hunter@example.com'
      fill_in 'Password', with: ''
      click_on 'Create Account'
    end
    expect(page).to have_content 'Password can\'t be blank'
  end

  scenario 'Password must be between min 8 characters ' do
    visit '/'

    within '.create_account' do
      fill_in 'Email', with: 'Hunter@example.com'
      fill_in 'Password', with: '12'
      click_on 'Create Account'
    end
    expect(page).to have_content 'Password is too short (minimum is 8 characters)'
  end
end