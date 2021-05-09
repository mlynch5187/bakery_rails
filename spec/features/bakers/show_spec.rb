require 'rails_helper'

RSpec.describe "Baker Show Page", type: :feature do
  before(:each) do
    @chef_john = Baker.create(name: "Chef John", job: "Head Chef", age: "34")
    @chef_alex = Baker.create(name: "Chef Alex", job: "Sous Chef", age: "54")
    @strawberry_pie = @chef_john.recipes.create(name: "Strawberry Pie",
                                                number_ingredients: 5,
                                                bake_time: 120,
                                                oven_temp: 300)
    @strawberry_pie.ingredients.create(name: "Strawberry", kind: "Fruit")
    visit "/bakers"
  end

  it "Each baker has a show page with name, job, and recipes" do
    expect(page).to have_link("Chef John")
    expect(page).to have_link("Chef Alex")

    click_link("Chef John")
    expect(current_path).to eq("/bakers/#{@chef_john.id}")
    expect(page).to have_content("Chef John")
    expect(page).to have_content("Head Chef")
    expect(page).to have_link("Recipes")
  end
end
