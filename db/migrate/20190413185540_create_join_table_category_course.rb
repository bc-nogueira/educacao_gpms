class CreateJoinTableCategoryCourse < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :courses do |t|
      t.index [:category_id, :course_id]
    end
  end
end
