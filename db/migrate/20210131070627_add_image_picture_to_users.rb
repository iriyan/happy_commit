class AddImagePictureToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image_picture, :string
  end
end
