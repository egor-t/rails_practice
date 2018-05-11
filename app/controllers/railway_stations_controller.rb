class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time]
  before_action :set_route, only: [:update_position, :update_time]

  # GET /railsway_stations
  # GET /railsway_stations.json
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railsway_stations/1
  # GET /railsway_stations/1.json
  def show
  end

  # GET /railsway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railsway_stations/1/edit
  def edit
  end

  # POST /railsway_stations
  # POST /railsway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Railsway station was successfully created.' }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railsway_stations/1
  # PATCH/PUT /railsway_stations/1.json
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Railsway station was successfully updated.' }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_position
    @route = Route.find(params[:route_id])
    @route.update_position(@route, params[:position])
    redirect_to @route
  end

  def update_time
    if @railway_station.update_time(@route, params[:arrival_time], params[:departure_time])
      flash[:notice] = 'Station date was successfully updated.'
    end
    redirect_to route_url(@route)
  end

  # DELETE /railsway_stations/1
  # DELETE /railsway_stations/1.json
  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
      @route = Route.find(params[:route_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
