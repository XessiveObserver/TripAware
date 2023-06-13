class CreatePitStops < ActiveRecord::Migration[7.0]
  def change
    create_table :pit_stops do |t|
      t.string :name
      t.string :location
      t.text :remarks
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
