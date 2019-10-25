# frozen_string_literal: true

class AddPositionToPotfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :potfolios, :position, :integer
  end
end
