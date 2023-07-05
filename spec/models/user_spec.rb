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

  end
end
