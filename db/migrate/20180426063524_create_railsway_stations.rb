# frozen_string_literal: true

class CreateRailswayStations < ActiveRecord::Migration[5.1]
  def change
    create_table :railway_stations do |t|
      t.string :title

      t.timestamps
    end
  end
end
