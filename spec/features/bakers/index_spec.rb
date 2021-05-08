require 'rails_helper'

RSpec.describe "Bakers Index", type: :feature do
  before(:each) do
    @chef_john = Baker.create(name: "Chef John", job: "Head Chef")
    @chef_alex = Baker.create(name: "Chef Alex", job: "Sous Chef")
    visit "/bakers"
  end

  it "It shows a list of baker names as links to show pages" do
    expect(page).to have_link("Chef John")
    expect(page).to have_link("Chef Alex")

    click_link("Chef John")
    expect(current_path).to eq("/bakers/#{@chef_john.id}")

    expect(page).to have_link("Return to Bakers Index")
    click_link("Return to Bakers Index")
    expect(current_path).to eq("/bakers")
  end

  it "I can delete a baker" do
    expect(page).to have_link("Delete Chef John")
    expect(page).to have_link("Delete Chef Alex")

    click_link("Delete Chef John")

    expect(current_path).to eq("/bakers")
    expect(page).to_not have_content("Chef John")
    expect(page).to have_content("Chef Alex")
  end
end
