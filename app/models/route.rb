class Route < ApplicationRecord
  validates :name, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  before_validation :set_name

  scope :grep_routes, -> (station) {where(id: station)}

  def update_position(route, position)
    station_position = railway_stations_routes.where(route: route).first
    station_position.update(position: position) if station_position
  end

  # def self.grep_routes(station)
  #   self.where("name LIKE ?", "%#{sanitize_sql_like(station)}%")
  # end

  def self.all_routes_by_query(a_station, b_station)
    grep_routes(a_station) & grep_routes(b_station)
  end

  protected

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end
end
