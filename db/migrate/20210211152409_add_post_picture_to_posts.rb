class AddPostPictureToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_picture, :string
  end
end
