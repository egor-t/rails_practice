class TrainsController < ApplicationController
  before_action :set_train, only: [:edit, :update, :show, :destory]

  def index
    @trains = Train.all
  end

  def new
    @train = Train.new
  end

  def show; end

  def create
    if @train.save
      redirect_to @train
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @train.update(train_params)
      redirect_to @train
    else
      render :new
    end
  end

  def destroy
    @train.destroy
    redirect_to trains_path
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number)
  end
end
