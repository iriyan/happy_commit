class RemoveExpFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :exp, :integer
  end
end
