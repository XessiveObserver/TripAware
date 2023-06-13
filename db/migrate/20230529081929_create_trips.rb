class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.text :reason
      t.string :for_how_long

      t.timestamps
    end
  end
end
