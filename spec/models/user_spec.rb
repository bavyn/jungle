require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

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
