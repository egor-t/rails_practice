class SeatCarriage < Carriage
  validates :seat_places, presence: true
end