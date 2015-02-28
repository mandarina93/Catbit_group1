class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.datetime :stepDate
      t.integer :stepAmount
	  t.integer :profile_id
	  
      t.timestamps null: false
    end
	add_foreign_key :steps, :profiles
  end
end
