class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :read, default: false
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
