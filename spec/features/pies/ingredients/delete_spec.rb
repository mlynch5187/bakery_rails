require 'rails_helper'

RSpec.describe "Ingredient Deletion", type: :feature do
  before(:each) do
    @salt = Ingredient.create(name: "Salt")
    @pepper = Ingredient.create(name: "Pepper")

    visit "/pies/ingredients"
  end

  it "I can click a button to delete an ingredient" do
    expect(page).to have_link("Delete Salt")
    expect(page).to have_link("Delete Pepper")

    click_link("Delete Salt")

    expect(current_path).to eq("/pies/ingredients")
    expect(page)to_not have_content("Salt")
    expect(page)to have_content("Pepper")
  end
end
