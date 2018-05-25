# frozen_string_literal: true

# Sv carriage
class SvCarriage < Carriage
  validates :bottom_seats, presence: true
end
