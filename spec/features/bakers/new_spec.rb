require 'rails_helper'

RSpec.describe "Bakers New Page", type: :feature do
  before(:each) do
    visit "/bakers"
  end

  it "It allows me to create a new baker" do
    expect(page).to have_link("New Baker")
    click_link("New Baker")
    expect(current_path).to eq("/bakers/new")

    name = "Chef Sarah"
    job = "Sous Chef"
    age = 27

    fill_in :name, with: name
    fill_in :kind, with: kind
    fill_in :age, with: age

    click_on "Create New Baker"

    expect(current_path).to eq("/bakers")
    expect(page).to have_link("Chef Sarah")
  end
end