# frozen_string_literal: true

# Seat carriage
class SeatCarriage < Carriage
  validates :seating_place, presence: true
end
