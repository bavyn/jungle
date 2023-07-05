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

    it 'is invalid when the name is empty' do
      category = Category.create(name: 'Cactus')
      product = Product.new(
        name: nil,
        price: 1000,
        quantity: 10,
        category: category
      )
      product.save
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'is invalid when the quantity is empty' do
      category = Category.create(name: 'Cactus')
      product = Product.new(
        name: 'Moon Cactus',
        price: 1000,
        quantity: nil,
        category: category
      )
      product.save
      expect(product.errors[:quantity]).to include("can't be blank")
    end

  end
end
