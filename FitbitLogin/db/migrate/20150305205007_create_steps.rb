class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.date :stepDate
      t.integer :stepAmount
	  t.integer :user_id

      t.timestamps null: false
    end
	add_foreign_key :users, :user_id
  end
end
