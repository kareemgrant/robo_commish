class Member < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :league_id
  phony_normalize :phone, :default_country_code => 'US'

  validates_presence_of :name, :email
  validates_plausible_phone :phone, :presence => true
end
