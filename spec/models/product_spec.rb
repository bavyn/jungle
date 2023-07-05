require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'is valid' do
      category = Category.create(name: 'Cactus')
      product = Product.new(
        name: 'Moon Cactus',
        price: 1000,
        quantity: 10,
        category: category
      )
      expect(product.save).to be true
    end


  end
end
