require 'spec_helper'

describe League do

  it "is valid with correct attributes" do
    user = League.new({name: "Cru Luv", fee_in_dollars: 300})
    expect(user).to be_valid
  end

  it "should not be valid without a name" do
    user = League.new({fee_in_dollars: 300})
    expect(user).to have(1).errors_on(:name)
  end

  it "should not be valid without a fee" do
    user = League.new({name: "Cru Luv"})
    expect(user).to have(2).errors_on(:fee)
    expect(user).to have(1).errors_on(:fee_in_dollars)
  end
end

