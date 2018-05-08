class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes, dependent: :destroy
  has_many :tickets, foreign_key: :current_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.position asc').uniq }
end
