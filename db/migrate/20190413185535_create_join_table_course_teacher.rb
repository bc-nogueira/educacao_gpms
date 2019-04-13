class CreateJoinTableCourseTeacher < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :teachers do |t|
      t.index [:course_id, :teacher_id]
    end
  end
end
