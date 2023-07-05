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


  end
end
