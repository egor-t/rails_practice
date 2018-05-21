# frozen_string_literal: true

# Tickets controller
class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_train, only: %i[new create]
  before_action :set_ticket, only: %i[show destroy]

  def index
    @tickets = current_user.admin? ? Ticket.includes(:user) : current_user.tickets
  end

  def new
    @ticket = Ticket.new
    @arrival_station = RailwayStation.find(params[:arrival_station])
    @departure_station = RailwayStation.find(params[:departure_station])
  end

  def show; end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = current_user
    @ticket.base_station = @train.route.railway_stations.first
    @ticket.end_station = @train.route.railway_stations.last
    if @ticket.save
      redirect_to tickets_path, notice: t('public.tickets.messages.created')
    else
      render :new
    end
  end

  def edit; end

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
    @ticket = current_user.admin? ? Ticket.find(params[:id]) : current_user.tickets.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
