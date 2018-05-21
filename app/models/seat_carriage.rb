# frozen_string_literal: true

# Seat carriage
class SeatCarriage < Carriage
  validates :seat_places, presence: true
end
