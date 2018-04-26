class CreateRailswayStations < ActiveRecord::Migration[5.1]
  def change
    create_table :railsway_stations do |t|
      t.string :title

      t.timestamps
    end
  end
end
