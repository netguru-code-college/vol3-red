class Estate < ApplicationRecord
  validates :name, presence: true
  has_many :buildings
  has_many :apartments, through: :buildings
  has_many :enotifications

  mount_uploader :estate_image, EstateImageUploader
  validates_integrity_of  :estate_image
  validates_processing_of :estate_image
 
  private
    def avatar_size_validation
      errors[:estate_image] << "should be less than 500KB" if estate_image.size > 0.5.megabytes
    end
end
