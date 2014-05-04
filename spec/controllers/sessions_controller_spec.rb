require 'spec_helper'

describe SessionsController do
  context 'username does not match' do
    it 'does not sign in' do
      post :create, username: 'doesnotexist'

      expect(session[:id]).to_not be
    end

    it 'redirects to the index page' do
      post :create, username: 'doesnotexist'

      expect(response).to redirect_to root_path
    end

    it 'it sets a flash message' do
      post :create, username: 'doesnotexist'

      expect(flash[:alert]).to eq 'invalid username/password'
    end
  end

  context 'invalid password' do
    let(:encrypted_password) {BCrypt::Password.create('password')}
    let!(:user) {User.create!(username: 'bobthany', password: encrypted_password)}

    it 'does not sign in' do
      post :create, username: 'bobthany', password: 'badpassword'

      expect(session[:id]).to_not be
    end
  end

  context 'with a matching username' do
    let(:encrypted_password) {BCrypt::Password.create('password')}
    let!(:user) {User.create!(username: 'bobthany', password: encrypted_password)}

    it 'signs them in' do
      post :create, username: 'bobthany', password: 'password'
      expect(session[:id]).to eq(user.id)
    end

    it 'redirect to the user page' do
      post :create, username: 'bobthany', password: 'password'
      expect(page).to redirect_to user_path(user)
    end

    it 'set a flash message' do
      post :create, username: 'bobthany', password: 'password'
      expect(flash[:info]).to eq 'You are logged in!'
      expect(flash[:alert]).to_not be
    end
  end
end