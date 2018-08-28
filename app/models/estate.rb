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
    default_image = 'estate.jpg'
    if id.present?
      if id[0,3] == 'id:'
        if Rails.configuration.carrierwave_storage == :dropbox
          self.estate_image.url
        else
          default_image
        end
      else
        if Rails.configuration.carrierwave_storage == :file
          self.estate_image.url 
        else
          default_image
        end
      end
    else
      default_image
    end
  end
 
  private
    def avatar_size_validation
      errors[:estate_image] << "should be less than 500KB" if estate_image.size > 0.5.megabytes
    end
end
