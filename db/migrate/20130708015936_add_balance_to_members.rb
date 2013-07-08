class AddBalanceToMembers < ActiveRecord::Migration
  def change
    add_column :members, :balance, :integer, default: 0
  end
end
