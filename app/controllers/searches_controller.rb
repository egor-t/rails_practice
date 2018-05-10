class SearchesController < ApplicationController
  def show
    # binding.pry
    @arrival_station = RailwayStation.find(params[:search][:arrival_station])
    @departure_station = RailwayStation.find(params[:search][:departure_station])
    @routes = Route.all_routes_by_query(@arrival_station, @departure_station)
  end
end
