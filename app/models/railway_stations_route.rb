# frozen_string_literal: true

# Railway Stations Route - join table
class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :position, uniqueness: { scope: :route_id, allow_nil: true }
end
