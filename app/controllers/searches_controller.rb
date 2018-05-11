class SearchesController < ApplicationController
  def show
    if params[:search]
      @routes = Route.all_routes_by_query(params[:search][:arrival_station],
                                          params[:search][:departure_station])
    end
  end
end
