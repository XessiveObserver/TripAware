class AddNameToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :name, :string
  end
end
