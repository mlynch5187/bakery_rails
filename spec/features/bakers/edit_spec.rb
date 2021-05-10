require 'rails_helper'

RSpec.describe "Baker edit Page", type: :feature do
  before(:each) do
    @chef_john = Baker.create(name: "Chef John", job: "Head Chef", age: "54")
    @chef_alex = Baker.create(name: "Chef Alex", job: "Sous Chef", age: "34")
    @strawberry_pie = @chef_john.recipes.create(name: "Strawberry Pie",
                                                number_ingredients: 5,
                                                bake_time: 120,
                                                oven_temp: 300)
    @strawberry_pie.ingredients.create(name: "Strawberry", kind: "Fruit")
    visit "/pies/ingredients"
  end

  it "It allows me to update a baker" do
    expect(page).to have_link("Update Chef John")
    click_link("Update Chef John")
    expect(current_path).to eq("/bakers/#{@chef_john.id}/edit")

    fill_in :name, with: "Chef Johnathan"
    fill_in :job, with: "Head Chef"
    fill_in :age, with: "55"

    click_on "Update Ingredient"

    expect(current_path).to eq("/bakers/#{@chef_john.id}")
    expect(page).to have_content("Chef Johnathan")
    expect(page).to have_content("55")
    expect(page).to_not have_content("54")
    expect(page).to_not have_content("Chef John")    
  end
end
