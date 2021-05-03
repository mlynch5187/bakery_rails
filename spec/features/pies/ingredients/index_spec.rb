require 'rails_helper'

RSpec.describe "Ingredients index", type: :feature do
  before(:each) do
    @salt = Ingredient.create(name: "Salt")
    @pepper = Ingredient.create(name: "Pepper")

    visit "/pies/ingredients"
  end

  it "It shows a list of ingredients" do
    expect(page).to have_content("Salt")
    expect(page).to have_content("Pepper")
  end
end
