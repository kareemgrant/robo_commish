class AddLeagueIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :league_id, :integer
  end
end
