require 'rails_helper'

RSpec.describe "Pie Ingredients Index", type: :feature do
  before(:each) do
    @salt = Ingredient.create(name: "Salt", kind: "Condiment")
    @pepper = Ingredient.create(name: "Pepper", kind: "Condiment")
    visit "/pies/ingredients"
  end

  it "It shows a list of ingredients" do
    expect(page).to have_content("Salt")
    expect(page).to have_content("Condiment")
    expect(page).to have_content("Pepper")
    expect(page).to have_content("Condiment")
  end

  it "I can delete an ingredient" do
    expect(page).to have_link("Delete Salt")
    expect(page).to have_link("Delete Pepper")

    click_link("Delete Salt")

    expect(current_path).to eq("/pies/ingredients")
    expect(page).to not_have_content("Salt")
    expect(page).to have_content("Pepper")
  end
end
