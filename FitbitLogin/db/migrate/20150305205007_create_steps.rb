class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.datetime :stepDate
      t.integer :stepAmount

      t.timestamps null: false
    end
  end
end
