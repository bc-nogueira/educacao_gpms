class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :title
      t.integer :discount
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
