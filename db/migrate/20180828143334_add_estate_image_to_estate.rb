class AddEstateImageToEstate < ActiveRecord::Migration[5.2]
  def change
    add_column :estates, :estate_image, :string
  end
end
