require 'spec_helper'

feature "Adding a new member to the league" do

  given!(:league){ create(:league)}

  background do
    visit leagues_path
    click_link_or_button "Cru Luv"
  end

  scenario "user adds a new member" do
    expect(current_path).to eq league_path(league)
    expect(page).to have_link("Add new member", href: new_league_member_path(league))

    click_link_or_button "Add new member"

    expect {
      fill_in "Full Name", with: "Kareem Grant"
      fill_in "Email Address", with: "kareem@getuserwise.com"
      fill_in "Mobile Phone", with: "2404322210"
      click_link_or_button "submit"
    }.to change(Member, :count).by 1

    expect(page).to have_content "Kareem Grant"
  end

  scenario "user attempts to add new member without name" do
    expect(current_path).to eq league_path(league)
    expect(page).to have_link("Add new member", href: new_league_member_path(league))
    click_link_or_button "Add new member"

    expect {
      fill_in "Email Address", with: "kareem@getuserwise.com"
      fill_in "Mobile Phone", with: "2404322210"
      click_link_or_button "submit"
    }.to_not change(Member, :count).by 1
  end

  scenario "user attempts to add new member without email" do
    expect(current_path).to eq league_path(league)
    expect(page).to have_link("Add new member", href: new_league_member_path(league))
    click_link_or_button "Add new member"

    expect {
      fill_in "Full Name", with: "Kareem Grant"
      fill_in "Mobile Phone", with: "2404322210"
      click_link_or_button "submit"
    }.to_not change(Member, :count).by 1
  end

  scenario "user attempts to add new member with invalid phone number" do
    expect(current_path).to eq league_path(league)
    expect(page).to have_link("Add new member", href: new_league_member_path(league))
    click_link_or_button "Add new member"

    expect {
      fill_in "Full Name", with: "Kareem Grant"
      fill_in "Email Address", with: "kareem@getuserwise.com"
      fill_in "Mobile Phone", with: "2404"
      click_link_or_button "submit"
    }.to_not change(Member, :count).by 1
  end

end

