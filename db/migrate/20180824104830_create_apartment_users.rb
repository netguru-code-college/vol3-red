class CreateApartmentUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :apartment_users do |t|
      t.integer :status

      t.belongs_to :apartment, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
