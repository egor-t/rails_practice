# frozen_string_literal: true

class AddRouteToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :route_id, :integer
  end
end
