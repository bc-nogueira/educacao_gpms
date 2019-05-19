class CreateCourseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :course_orders do |t|
      t.references :course, foreign_key: true
      t.references :order, foreign_key: true
      t.decimal :final_price

      t.timestamps
    end
  end
end
