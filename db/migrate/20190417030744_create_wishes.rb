class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
