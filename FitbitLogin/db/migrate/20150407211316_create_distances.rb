class CreateDistances < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.integer :distanceAmount
      t.date :distanceDate

      t.timestamps null: false
    end
  end
end
