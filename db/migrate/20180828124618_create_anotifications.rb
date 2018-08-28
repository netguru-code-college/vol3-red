class CreateAnotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :anotifications do |t|
      t.string :title
      t.text :body
      t.date :valid_up_to_date
      t.belongs_to :apartment, index: true

      t.timestamps
    end
  end
end
