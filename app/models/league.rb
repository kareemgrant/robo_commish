class League < ActiveRecord::Base
  attr_accessible :fee, :name

  validates_presence_of :name, :fee
  validates_uniqueness_of :name
  validates_numericality_of :fee, greater_than: 0
end
