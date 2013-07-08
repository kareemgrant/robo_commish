class League < ActiveRecord::Base
  attr_accessible :fee, :name, :fee_in_dollars

  has_many :members

  validates_presence_of :name, :fee, :fee_in_dollars
  validates_numericality_of :fee, greater_than: 0
  validates_uniqueness_of :name


  def fee_in_dollars
    fee.to_f / 100 if fee
  end

  def fee_in_dollars=(dollars)
    self.fee = dollars.to_f * 100
  end
end
