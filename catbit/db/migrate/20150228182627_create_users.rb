class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	t.string :user_name, :null => false, :default => ""
	t.string :password, :null => false, :default => ""

      t.timestamps null: false
    end
  end
end
