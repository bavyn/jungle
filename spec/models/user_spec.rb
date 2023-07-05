require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is valid' do
      user = User.new(
        first_name: 'Sasha',
        last_name: 'Velour',
        email: 'sasha@example.com',
        password: 'password',
        password_confirmation: 'password'
      ).save
      expect(user).to eq(true)
    end

    it 'is invalid when the first name is empty' do
      user = User.new(first_name: nil).save
      expect(user).to eq(false)
    end

    it 'is invalid when the last name is empty' do
      user = User.new(last_name: nil).save
      expect(user).to eq(false)
    end

    it 'is invalid when the password is empty' do
      user = User.new(password: nil).save
      expect(user).to eq(false)
    end

    it 'is invalid when the password confirmation is empty' do
      user = User.new(password_confirmation: nil).save
      expect(user).to eq(false)
    end

    it 'is invalid when password and password confirmation do not match' do
      user = User.new(password: 'aaaaaaaaaaaa', password_confirmation: 'bbbbbbbbbbbb').save
      expect(user).to eq(false)
    end

    it 'is invalid when the email is empty' do
      user = User.new(email: nil).save
      expect(user).to eq(false)
    end

    it 'is invalid with a duplicate email, not case sensitive' do
      existing_user = User.new(email: "a@a.com").save
      new_user = User.new(email: "a@a.com").save
      expect(new_user).to eq(false)
    end

    it 'requires a minimum password length of 8 characters' do
      user = User.new(password: '1234567')
      user.save
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 8 characters)')
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        first_name: 'Alyssa',
        last_name: 'Edwards',
        email: 'alyssa@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    it 'returns a user if the email and password match' do
      auth_user = User.authenticate_with_credentials('alyssa@example.com', 'password')
      expect(auth_user).to eq(@user)
    end

    it 'returns nil if the password does not match the email' do
      auth_user = User.authenticate_with_credentials('alyssa@example.com', 'ejfgvseilgfrlie')
      expect(auth_user).to be_nil
    end

    it 'returns nil if the email is not associated to a user' do
      auth_user = User.authenticate_with_credentials('bademail@example.com', 'password')
      expect(auth_user).to be_nil
    end

    it 'email is not case-sensitive' do
      auth_user = User.authenticate_with_credentials('ALYssa@exaMple.COm', 'password')
      expect(auth_user).to eq(@user)
    end

    it 'ignores leading and trailing whitespace in the email field' do
      auth_user = User.authenticate_with_credentials('  alyssa@example.com ', 'password')
      expect(auth_user).to eq(@user)
    end

  end
end
