class CreateTeacherRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_ratings do |t|
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
