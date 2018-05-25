# frozen_string_literal: true

# Carriage main class for all type of carriages
class Carriage < ApplicationRecord
  TYPES = %w[CoupeCarriage SvCarriage EconomyCarriage SeatCarriage].freeze
  belongs_to :train

  validates :train, :type, :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_carriage_number

  private

  def set_carriage_number
    self.number = max_carriage_number + 1
  end

  def max_carriage_number
    train.carriages.pluck(:number).max || 0
  end
end
