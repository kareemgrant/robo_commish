require 'spec_helper'

describe Member do
  let!(:league) { create(:league) }

  it "is valid with correct attributes" do
    member = Member.new({name: "Kareem Grant", email: "kg@gmail.com", phone: "111222333", league_id: league.id})
    expect(member).to be_valid
  end

  it "should not be valid without name" do
    member = Member.new({email: "kg@gmail.com", phone: "111222333", league_id: league.id})
    expect(member).to have(1).errors_on(:name)
  end

  it "should not be valid without email" do
    member = Member.new({name: "Kareem Grant", phone: "111222333", league_id: league.id})
    expect(member).to have(1).errors_on(:email)
  end

  it "should not be valid without phone" do
    member = Member.new({name: "Kareem Grant", email: "kg@gmail.com", league_id: league.id})
    expect(member).to have(1).errors_on(:phone)
  end

  it "should not be valid without league_id" do
    member = Member.new({name: "Kareem Grant", email: "kg@gmail.com", phone: "1112223333"})
    expect(member).to have(1).errors_on(:league_id)
  end

  it "should have a balance equal to the league fee" do
    member = Member.create({name: "Kareem Grant", email: "kg@gmail.com", phone: "111222333", league_id: league.id})
    expect(member.balance).to equal league.fee
  end
end
