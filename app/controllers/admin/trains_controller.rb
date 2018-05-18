class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:edit, :update, :show, :destroy]

  def index
    @trains = Train.all
  end

  def new
    @train = Train.new
  end

  def show; end

  def create
    @train = Train.new(train_params)
    if @train.save
      redirect_to admin_train_path(@train)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @train.update(train_params)
      redirect_to admin_train_path(@train)
    else
      render :new
    end
  end

  def destroy
    @train.destroy
    redirect_to admin_trains_path
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :current_station_id)
  end
end
