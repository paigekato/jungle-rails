require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      user = User.create(
        name: "Paige",
        email: "paige@paige.com",
        password: "meow",
        password_confirmation: "meow"

        )
      expect(user).to (be_valid)
    end

    it 'should have password and password confirmation' do
      user = User.create(
        name: "Paige",
        email: "paige@paige.com",
        password: "meow",
        password_confirmation: nil
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save without unique email' do
      @user = User.create(
        name: "Paige",
        email: "paige@paige.com",
        password_digest: "me"
        )
      @user2 = User.create(
        name: "Paige",
        email: "paige@PAIGE.com",
        password_digest: "me"
        )
    expect(@user2).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      password = User.create(
        name: "Paige",
        email: "paigekato@gmail.com",
        password: "meow",
        password_confirmation: "moo"
        )
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'should have name to be a valid user' do
      user = User.create(
        name: nil,
        email: "paige@paige.com",
        password: "meow",
        password_confirmation: "meow")
      expect(user).to_not (be_valid)
    end

    it 'should have a password with a minimum length of 3' do
      user = User.create(
        name: "Paige",
        email: "paige@paige.com",
        password: "ah",
        password_confirmation: "ah"
        )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    user = User.create(
      name: "paige",
      email: "paigekato@gmail.com",
      password: "asssh",
      password_confirmation: "asssh"
      )
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not be_valid
    end
  end
end