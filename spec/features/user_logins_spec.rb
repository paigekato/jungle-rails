require 'rails_helper'

RSpec.feature "User can click 'Add to Cart' button and cart increase by one", type: :feature, js: true do

  before :each do

    User.create!(
      name: Faker::Hipster.sentence(1)
      email: "Testing@testing.com"
      password: "moozik"
      )
  end

  scenario "Cart updates by one" do
    # ACT
    visit root_path
    first('.product').click_link('Add')
    # DEBUG /
    expect(page).to have_text 'My Cart (1)'
    save_screenshot

  end

end