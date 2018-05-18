class SearchesController < ApplicationController
  before_action :set_stations, only: :show

  def show
    if params[:arrival_station]
      start_station = RailwayStation.find(params[:arrival_station])
      end_station = RailwayStation.find(params[:departure_station])
      session[:start_station] = start_station
      session[:end_station] = end_station
      @routes = Route.all_routes_by_query(start_station, end_station)
    end
  end

  protected

  def set_stations
    @stations = RailwayStation.all
  end
end
