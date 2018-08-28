class Building < ApplicationRecord
  validates :street, presence: true, length: { maximum: 100 }
  validates :building_number, presence: true, length: { maximum: 5 }
  validates :city, presence: true, length: { maximum: 100 }
  VALID_PL_ZIP_CODE_REGEX = /[0-9]{2}-[0-9]{3}/
  validates :zip_code,
            presence: true,
            length: { maximum: 6 },
            format: { with: VALID_PL_ZIP_CODE_REGEX }

  has_many :apartments
  belongs_to :estate
  has_many :bnotification
end
