class RenameScoreColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :score, :grade_id
  end
end
