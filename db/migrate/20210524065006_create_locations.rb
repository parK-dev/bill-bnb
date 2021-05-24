class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name,            null: false, default: ""
      t.string :address,         null: false, default: ""
      t.integer :price_per_day
      t.string :description,     null: false, default: ""
      t.integer :capacity
      t.references :user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
