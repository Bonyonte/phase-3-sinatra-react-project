class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :teacher_name
      t.integer :lesson_id
      t.string :teacher_email
  end
end
