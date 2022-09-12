class AddStudentsImageToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :student_image, :string
  end
end
