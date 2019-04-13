class CreateCourseRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :course_ratings do |t|
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
