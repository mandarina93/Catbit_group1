class CreateDistances < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.float :distanceAmount
      t.date :distanceDate
	  t.integer :user_id
	  
      t.timestamps null: false
    end
	add_foreign_key :users, :user_id
  end
end
