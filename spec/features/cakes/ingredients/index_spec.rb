require 'rails_helper'

RSpec.describe "Cakes ingredients index", type: :feature do
  before(:each) do
    @cherry = Ingredient.create(name: "Cherry")
    @blueberry = Ingredient.create(name: "Blueberry")

    visit "/cakes/ingredients"
  end

  it "It shows a list of cake ingredients" do
    expect(page).to have_content("Cherry")
    expect(page).to have_content("Blueberry")
  end
end
