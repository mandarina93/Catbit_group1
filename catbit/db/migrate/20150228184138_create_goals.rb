class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goalName
      t.integer :goalAmount
	  t.integer :profile_id
	  t.integer :time_frame_id
	  
      t.timestamps null: false
    end
	add_foreign_key :goals, :profiles
	add_foreign_key :goals, :time_frames
  end
end
