require 'rails_helper'

RSpec.describe "Pie Ingredients New Page", type: :feature do
  before(:each) do
    visit "/pies/ingredients"
  end

  it "It allows me to create a new ingredient" do
    expect(page).to have_link("New Ingredient")
    click_link("New Ingredient")
    expect(current_path).to eq("/pies/ingredients/new")

    name = "Butter"
    kind = "Oil"

    fill_in :name, with: name
    fill_in :kind, with: kind

    click_on "Create New Ingredient"

    expect(current_path).to eq("/pies/ingredients")
    expect(page).to have_content("Butter")
  end

  it "It allows me to create a new ingredient only if all fields are filled" do
    click_link("New Ingredient")

    fill_in :name, with: "Butter"
    fill_in :kind, with: ""

    click_on "Create New Ingredient"

    expect(current_path).to eq("/pies/ingredients/new")
    expect(page).to have_content("Please fill out all fields and give the ingredient a unique name")
  end

  it "Only allows me to create an ingredient with a unique name" do
    @butter = Ingredient.create(name: "Butter", kind: "Oil")
    click_link("New Ingredient")

    fill_in :name, with: "Butter"
    fill_in :kind, with: "Oil"

    click_on "Create New Ingredient"

    expect(current_path).to eq("/pies/ingredients/new")
    expect(page).to have_content("Please fill out all fields and give the ingredient a unique name")
  end
end
