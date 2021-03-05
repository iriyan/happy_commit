class RemoveExpSumFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :exp_sum, :integer
  end
end
