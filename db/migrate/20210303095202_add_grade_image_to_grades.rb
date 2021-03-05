class AddGradeImageToGrades < ActiveRecord::Migration[6.0]
  def change
    add_column :grades, :grade_image, :string
  end
end
