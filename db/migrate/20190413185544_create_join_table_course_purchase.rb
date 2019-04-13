class CreateJoinTableCoursePurchase < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :purchases do |t|
      t.index [:course_id, :purchase_id]
    end
  end
end
