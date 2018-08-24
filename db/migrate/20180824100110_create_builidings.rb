class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :street
      t.integer :building_number
      t.string :city
      t.string :zip_code
      t.belongs_to :estate, index: true

      t.timestamps
    end
  end
end
