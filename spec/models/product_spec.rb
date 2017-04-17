require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid product' do
      @category = Category.create(name:"Food")
      product = Product.new(
        name: "Pineapple",
        price: 34.00,
        quantity: 15,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end

    it 'should not save without valid name' do
      @category = Category.create(name: "Food")
      name = Product.new(
        name: nil,
        price: 34.00,
        quantity: 15,
        category_id: @category.id
        )
      expect(name).to_not (be_valid)
    end

    it 'should not save without valid price' do
      @category = Category.create(name: "Food")
      price = Product.new(
        name: "Cat Socks",
        price: nil,
        quantity: 15,
        category_id: @category.id
        )
      expect(price).to_not (be_valid)
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name: "Food")
      quantity = Product.new(
        name: "Hot Dog",
        price: 34.00,
        quantity: nil,
        category_id: @category.id
        )
      expect(quantity).to_not (be_valid)
    end

    it 'should not save without valid category id' do
      @category = Category.create(name: "Food")
      category_id = Product.new(
        name: nil,
        price: 34.00,
        quantity: 15,
        category_id: nil
        )
      expect(category_id).to_not (be_valid)
    end
  end
end