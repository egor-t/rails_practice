# frozen_string_literal: true

# Coupe carriage model
class CoupeCarriage < Carriage
  validates :top_seats, :bottom_seats, presence: true
end
