class RemoveGradeIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :grade_id, :integer
  end
end
