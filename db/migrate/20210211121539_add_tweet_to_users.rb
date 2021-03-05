class AddTweetToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tweet, :string
  end
end
