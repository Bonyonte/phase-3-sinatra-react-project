class AddTeachersImageToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :teacher_image, :string
  end
end
