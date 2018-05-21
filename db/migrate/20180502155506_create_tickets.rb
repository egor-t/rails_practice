# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :train, index: true
      t.belongs_to :base_station
      t.belongs_to :end_station

      t.timestamps
    end
  end
end
