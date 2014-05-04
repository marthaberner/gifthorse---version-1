require 'spec_helper'


describe UsersController do
  describe 'POST #create' do
    it 'encrypts the password' do
      BCrypt::Password.stub(:create) { 'hashedpassword' }

      post :create, user: {password: 'thepassword', username: 'someusername'}

      user = User.last

      expect(user.password).to eq 'hashedpassword'
      expect(BCrypt::Password).to have_received(:create).with('thepassword')
    end
  end
end