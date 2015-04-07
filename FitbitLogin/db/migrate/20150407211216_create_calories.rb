class CreateCalories < ActiveRecord::Migration
  def change
    create_table :calories do |t|
      t.date :calorieDate
      t.integer :calorieIn
      t.integer :calorieOut

      t.timestamps null: false
    end
  end
end
