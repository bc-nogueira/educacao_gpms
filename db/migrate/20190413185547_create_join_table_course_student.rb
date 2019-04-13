class CreateJoinTableCourseStudent < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :students do |t|
      t.index [:course_id, :student_id]
    end
  end
end
