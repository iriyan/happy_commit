class RenameFightIdColumnToFights < ActiveRecord::Migration[6.0]
  def change
    rename_column :fights, :fight_id, :goal_id
  end
end
