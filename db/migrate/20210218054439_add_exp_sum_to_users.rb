class AddExpSumToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :exp_sum, :integer
  end
end
