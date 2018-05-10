class SearchesController < ApplicationController
  def show
    # binding.pry
    if params[:search]
      # @arrival_station = RailwayStation.find(params[:search][:arrival_station])
      # @departure_station = RailwayStation.find(params[:search][:departure_station])
      @routes = Route.all_routes_by_query(params[:search][:arrival_station],
                                          params[:search][:departure_station])
      # binding.pry
    end
  end
end
