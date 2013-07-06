require 'spec_helper'

feature "Creating a new league" do

  background do
    visit leagues_path
    click_link_or_button "Create New League"
  end

  scenario "user creates a new league" do

    expect(current_path).to eq new_league_path

    expect {
      fill_in "League Name", with: "Cru Luv"
      fill_in "League Fee", with: "300"
      click_link_or_button "Create League"
    }.to change(League, :count).by 1

    within '.alert' do
      expect(page).to have_content "League was successfully created"
    end
  end

  scenario "user attempts to create new league without a fee" do

    expect(current_path).to eq new_league_path

    expect {
      fill_in "League Name", with: "Cru Luv"
      click_link_or_button "Create League"
    }.to_not change(League, :count).by 1

    within '.alert' do
      expect(page).to have_content "League could not be saved"
    end
  end

  scenario "user attempts to create new league without a name" do

    expect(current_path).to eq new_league_path

    expect {
      fill_in "League Fee", with: "300"
      click_link_or_button "Create League"
    }.to_not change(League, :count).by 1

    within '.alert' do
      expect(page).to have_content "League could not be saved"
    end
  end


  scenario "user attempts to create new league with a duplicate name" do
    FactoryGirl.create(:league)
    expect(current_path).to eq new_league_path

    expect {
      fill_in "League Name", with: "Cru Luv"
      fill_in "League Fee", with: "300"
      click_link_or_button "Create League"
    }.to_not change(League, :count).by 1

    within '.alert' do
      expect(page).to have_content "League could not be saved"
    end
  end

  scenario "user attempts to create a new league with a fee less than zero" do

    expect(current_path).to eq new_league_path

    expect {
      fill_in "League Name", with: "Cru Luv"
      fill_in "League Fee", with: "-100"
      click_link_or_button "Create League"
    }.to_not change(League, :count).by 1

    within '.alert' do
      expect(page).to have_content "League could not be saved"
    end
  end
end

feature "Listing of Leagues" do
  given!(:league_1) { FactoryGirl.create(:league) }
  given!(:league_2) { FactoryGirl.create(:league, name: "Fantasy Football", fee: 20) }

  background do
    visit leagues_path
  end

  scenario "all created leagues should be displayed" do
    expect(page).to have_content "League Listing"

    expect(page).to have_link("Cru Luv", href: league_path(league_1))
    expect(page).to have_link("Fantasy Football", href: league_path(league_2))
    expect(page).to have_content "Fantasy Football"
  end
end
