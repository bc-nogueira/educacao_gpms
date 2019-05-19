class CreateCourseTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :course_trails do |t|
      t.references :course, foreign_key: true
      t.references :trail, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
