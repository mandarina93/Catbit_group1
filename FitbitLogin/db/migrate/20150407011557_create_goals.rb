class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :goalName
      t.integer :timeFrame
      t.integer :goalAmount
	  t.integer :user_id

      t.timestamps null: false
    end
	add_foreign_key :users, :user_id
  end
end
