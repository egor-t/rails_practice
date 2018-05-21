# frozen_string_literal: true

class AddSortingStatusForTrainCarriages < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :carriage_type_sort, :boolean, default: true
  end
end
