class SearchesController < ApplicationController
  before_action :set_stations, only: :show

  def show
    if params
      @start_station = RailwayStation.find(params[:arrival_station])
      @end_station = RailwayStation.find(params[:departure_station])
      @routes = Route.all_routes_by_query(@start_station, @end_station)
    end

  end

  protected

  def set_stations
    @stations = RailwayStation.all
  end
end
