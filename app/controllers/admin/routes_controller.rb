class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:edit, :update, :show, :destory]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def edit; end

  def show; end

  def create
    if Route.create!(route_params)
      redirect_to admin_route_path(Route.last)
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to admin_route_path(@route)
    else
      render :new
    end
  end

  def destroy
    set_route
    @route.destroy
    redirect_to admin_routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end
end