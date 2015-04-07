class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :goalName
      t.integer :timeFrame
      t.integer :goalAmount

      t.timestamps null: false
    end
  end
end
