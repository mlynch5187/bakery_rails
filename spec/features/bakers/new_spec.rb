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
    age = "27"

    fill_in :name, with: name
    fill_in :job, with: job
    fill_in :age, with: age

    click_on "Create New Baker"

    expect(current_path).to eq("/bakers")
    expect(page).to have_link("Chef Sarah")
  end

  it "It allows me to create a new baker only if all fields are filled" do
    click_link("New Baker")

    fill_in :name, with: "Chef Sarah"
    fill_in :job, with: "Sous Chef"
    fill_in :age, with: ""

    click_on "Create New Baker"

    expect(current_path).to eq("/bakers/new")
    expect(page).to have_content("Please fill out all fields and give the baker a unique name")
  end

  it "Only allows me to create a baker with a unique name" do
    @chef_sarah = Baker.create(name: "Chef Sarah", job: "Sous Chef", age: "27")
    click_link("New Baker")

    fill_in :name, with: "Chef Sarah"
    fill_in :job, with: "Sous Chef"
    fill_in :age, with: "27"

    click_on "Create New Baker"

    expect(current_path).to eq("/bakers/new")
    expect(page).to have_content("Please fill out all fields and give the baker a unique name")
  end
end
