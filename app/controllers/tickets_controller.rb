class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @arrival_station = RailwayStation.find(params[:arrival_station])
    @departure_station = RailwayStation.find(params[:departure_station])
  end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = current_user
    @ticket.base_station = @train.route.railway_stations.first
    @ticket.end_station = @train.route.railway_stations.last
    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket was successfully created.'
    else
      redirect_to search_path, notice: 'Some problem with ticket creation.'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name,
                                   :user_passport, :base_station, :end_station)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
