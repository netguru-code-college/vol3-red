class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string :name
      t.belongs_to :building, index: true
      t.timestamps
    end
  end
end
