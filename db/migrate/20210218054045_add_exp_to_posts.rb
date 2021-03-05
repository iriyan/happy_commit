class AddExpToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :exp, :integer
  end
end
