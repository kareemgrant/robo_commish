class Member < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :league_id
  belongs_to :league
  phony_normalize :phone, :default_country_code => 'US'

  validates_presence_of :name, :email, :league_id
  validates_plausible_phone :phone, :presence => true

  before_save :set_balance


  def balance_in_dollars
    balance.to_f / 100 if balance
  end

  def balance_in_dollars=(dollars)
    self.balance = dollars.to_f * 100
  end

  private

  def set_balance
    self.balance = self.league.fee
  end

end
