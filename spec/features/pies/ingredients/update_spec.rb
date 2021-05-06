require 'rails_helper'

RSpec.describe "Pie Ingredients New Page", type: :feature do
  before(:each) do
    @salt = Ingredient.create(name: "Salt", kind: "Condiment")
    @pepper = Ingredient.create(name: "Pepper", kind: "Condiment")
    visit "/pies/ingredients"
  end

  it "It allows me to update an ingredient" do
    expect(page).to have_link("Update Salt")
    click_link("Update Salt")
    expect(current_path).to eq("/pies/ingredients/#{@salt.id}/edit")

    name = "Kosher Salt"
    kind = "Condiment"

    fill_in :name, with: name
    fill_in :kind, with: kind

    click_on "Update Ingredient"

    expect(current_path).to eq("/pies/ingredients/#{@salt.id}")
    expect(page).to have_content("Kosher Salt")
  end
end
