class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :userName
      t.integer :userAge
      t.string :userGender
      t.integer :userHeight
      t.integer :userWeight
	  t.integer :user_id

      t.timestamps null: false
    end
	add_foreign_key :profiles, :users
  end
end
