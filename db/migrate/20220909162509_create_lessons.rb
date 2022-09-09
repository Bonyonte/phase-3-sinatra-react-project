class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :lesson_name
      t.string :lesson_teacher
      t.integer :teacher_id
      t.string :progress 
      t.timestamps
    end
  end
end
