# frozen_string_literal: true

class AddSeatPlaceToCarriage < ActiveRecord::Migration[5.1]
  def change
    add_column :carriages, :seating_place, :integer
  end
end
