class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.integer :apartment_number

      t.timestamps
    end
  end
end
