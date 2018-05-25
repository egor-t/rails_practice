# frozen_string_literal: true

# Admin::Carriage controller
class Admin::CarriagesController < Admin::BaseController
  before_action :set_train, only: %i[new create]
  before_action :set_carriage, only: %i[edit update show destroy]

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to admin_train_path(@train), note: 'Carriage added!'
    else
      render 'new'
    end
  end

  def show; end

  def destroy
    @carriage.destroy
    redirect_to admin_carriages_path
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:top_seats, :bottom_seats, :train_id, :type,
                                     :side_top_seats, :side_bottom_seats, :seating_place)
  end
end
