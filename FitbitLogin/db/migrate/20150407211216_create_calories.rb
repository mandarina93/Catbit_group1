class CreateCalories < ActiveRecord::Migration
  def change
    create_table :calories do |t|
      t.date :calorieDate
      t.integer :calorieIn
      t.integer :calorieOut
	  t.integer :user_id
	  
      t.timestamps null: false
    end
	add_foreign_key :users, :user_id
  end
end
