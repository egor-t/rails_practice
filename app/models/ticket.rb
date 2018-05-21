# frozen_string_literal: true

# Ticket model
class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :base_station, class_name: 'RailwayStation', foreign_key: :base_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :user_first_name, :user_middle_name, :user_last_name, :user_passport, presence: true

  after_create :send_notification
  after_destroy :send_delete_notification

  def route_name
    "#{base_station.title} - #{end_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def send_delete_notification
    TicketsMailer.delete_ticket(user, self).deliver_now
  end
end
