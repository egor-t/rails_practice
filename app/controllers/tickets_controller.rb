class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_train, only: [:new, :create]
  before_action :set_ticket, only: [:show, :destroy]

  def index
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets
    end
  end

  def new
    @ticket = Ticket.new
    @arrival_station = RailwayStation.find(params[:arrival_station])
    @departure_station = RailwayStation.find(params[:departure_station])
  end

  def show
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

  def edit
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name,
                                   :user_passport, :base_station, :end_station)
  end

  def set_ticket
    if current_user.admin?
      @ticket = Ticket.find(params[:id])
    else
      @ticket = current_user.tickets.find(params[:id])
    end
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
