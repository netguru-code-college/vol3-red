class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, :surname, :email, presence: true
  has_many :apartment_users
  has_many :apartments, through: :apartment_users

  mount_uploader :thumbnail, ThumbnailUploader
  validates_integrity_of  :thumbnail
  validates_processing_of :thumbnail
 
  private
    def avatar_size_validation
      errors[:thumbnail] << "should be less than 500KB" if thumbnail.size > 0.5.megabytes
    end
end
