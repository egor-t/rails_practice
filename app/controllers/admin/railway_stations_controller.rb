# frozen_string_literal: true

# Admin RailwayStations controller
class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: %i[show edit update destroy update_position update_time]
  before_action :set_route, only: %i[update_position update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show; end

  def new
    @railway_station = RailwayStation.new
  end

  def edit; end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to admin_railway_station_path(@railway_station), notice: t('admin.railway_stations.messages.created')
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_stations_path, notice: t('admin.railway_stations.messages.updated')
    else
      render :edit
    end
  end

  def update_position
    if @railway_station.update_position(@route, params[:position])
      flash[:notice] = t('admin.railway_stations.messages.updated')
    end
    redirect_to admin_route_url(@route)
  end

  def update_time
    if @railway_station.update_time(@route, params[:arrival_time], params[:departure_time])
      flash[:notice] = t('admin.railway_stations.messages.updated')
    end
    redirect_to admin_route_url(@route)
  end

  def destroy
    redirect_to admin_railway_stations_url, notice: t('admin.railway_stations.messages.deleted') if @railway_station.destroy
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def set_route
    @route = Route.find(params[:route_id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
