class Train < ApplicationRecord
  validates :number, presence: true

  has_many :carriages, ->(train) { order("number #{train.carriage_type_sort ? 'ASC' : 'DESC'}")}
  has_many :tickets
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  validates :carriage_type_sort, inclusion: { in: [true, false] }

  def total_number_of_seats(type_of_carriage, type_of_seats)
    self.carriages.where(type: type_of_carriage).pluck(type_of_seats).sum
  end
end
