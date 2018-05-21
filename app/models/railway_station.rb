# frozen_string_literal: true

# Railway Station model
class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes, dependent: :destroy
  has_many :tickets, foreign_key: :current_station_id

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_time(route, arrival_time, departure_time)
    staion_route = station_route(route)
    staion_route&.update(arrival_time: arrival_time, departure_time: departure_time)
  end

  def update_position(route, index)
    staion_route = station_route(route)
    staion_route&.update(position: index)
  end

  def departure_time(route)
    station_route(route).try(:departure_time)
  end

  def arrival_time(route)
    station_route(route).try(:arrival_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
