# frozen_string_literal: true

class AddDateDataForStations < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :arrival_time, :datetime
    add_column :railway_stations_routes, :departure_time, :datetime
  end
end
