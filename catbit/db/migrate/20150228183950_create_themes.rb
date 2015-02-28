class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
	  t.integer :profile_id
	  
      t.timestamps null: false
    end
	add_foreign_key :themes, :profiles
  end
end
