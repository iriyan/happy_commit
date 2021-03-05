class AddDateToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :date, :integer
  end
end
