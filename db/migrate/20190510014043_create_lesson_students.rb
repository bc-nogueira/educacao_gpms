class CreateLessonStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_students do |t|
      t.boolean :watched
      t.references :student, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
