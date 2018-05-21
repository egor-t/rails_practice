# frozen_string_literal: true

# Economy carriage model
class EconomyCarriage < Carriage
  validates :top_places, :bottom_places, :side_bottom_places, :side_top_places, presence: true
end
