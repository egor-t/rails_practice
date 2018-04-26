class RoutesController < ApplicationController
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
      redirect_to routes_path
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :new
    end
  end

  def destroy
    set_route
    @route.destroy
    redirect_to routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name)
  end
end