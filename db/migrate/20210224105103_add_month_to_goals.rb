class AddMonthToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :month, :integer
  end
end
