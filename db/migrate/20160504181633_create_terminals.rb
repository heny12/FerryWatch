class CreateTerminals < ActiveRecord::Migration
  def change
    create_table :terminals do |t|
      t.string :name
      t.integer :terminal_id
      t.string :abbreviation

      t.timestamps null: false
    end
  end
end
