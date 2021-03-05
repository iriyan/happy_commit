class AddAchievementToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :achievement, :string
  end
end
