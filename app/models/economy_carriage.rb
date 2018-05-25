# frozen_string_literal: true

# Economy carriage model
class EconomyCarriage < Carriage
  validates :top_seats, :bottom_seats, :side_bottom_seats, :side_top_seats, presence: true
end
