require 'rails_helper'

RSpec.describe "Pie Ingredients Show Page", type: :feature do
  before(:each) do
    @salt = Ingredient.create(name: "Salt", kind: "Condiment")
    @pepper = Ingredient.create(name: "Pepper", kind: "Condiment")
    @pepper = Ingredient.create(name: "Butter", kind: "Oil")
    visit "/pies/ingredients"
  end

  it "It allows me to click on an ingredient" do
    expect(page).to have_link("Salt")
    click_link("Salt")
    expect(current_path).to eq("/pies/ingredients/#{@salt.id}")
    expect(page).to have_content("This ingredient is called Salt")
    expect(page).to have_content("This ingredient is a Condiment")
  end

  it "I can delete an ingredient" do
    click_link("Salt")

    expect(page).to have_link("Delete Salt")
    expect(page).to_not have_link("Delete Pepper")

    click_link("Delete Salt")

    expect(current_path).to eq("/pies/ingredients")
    expect(page).to_not have_content("Salt")
    expect(page).to have_content("Pepper")
  end
end
