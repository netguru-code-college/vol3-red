class Estate < ApplicationRecord
  validates :name, presence: true
  has_many :buildings
  has_many :apartments, through: :buildings
  has_many :enotifications

  mount_uploader :estate_image, EstateImageUploader
  validates_integrity_of  :estate_image
  validates_processing_of :estate_image

  def get_estate_image
    id = self.estate_image_identifier
    if id.present? and id[0,3] == 'id:'
      self.estate_image.url
    else
      'estate.jpg'
    end
  end
 
  private
    def avatar_size_validation
      errors[:estate_image] << "should be less than 500KB" if estate_image.size > 0.5.megabytes
    end
end
