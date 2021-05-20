require 'rails_helper'

RSpec.describe "Bakers Index", type: :feature do
  before(:each) do
    @chef_john = Baker.create(name: "Chef John", job: "Head Chef", age: "54")
    @chef_alex = Baker.create(name: "Chef Alex", job: "Sous Chef", age: "34")
    @strawberry_pie = @chef_john.recipes.create(name: "Strawberry Pie",
                                                number_ingredients: 5,
                                                bake_time: 120,
                                                oven_temp: 300)
    @strawberry = @strawberry_pie.ingredients.create(name: "Strawberry", kind: "Fruit")
    visit "/bakers/#{@chef_john.id}"
  end

  it "It shows a list of baker recipes as links to recipe show pages" do    
    click_link("Recipes")
    expect(current_path).to eq("/bakers/#{@chef_john.id}/recipes")

    expect(page).to have_link("Strawberry Pie")
    click_link("Strawberry Pie")
    expect(current_path).to eq("/bakers/#{@chef_john.id}/recipes/#{@strawberry_pie.id}")
  end
end
