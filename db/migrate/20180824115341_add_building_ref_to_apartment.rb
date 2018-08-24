class AddBuildingRefToApartment < ActiveRecord::Migration[5.2]
  def change
    add_reference :apartments, :building, foreign_key: true
  end
end
