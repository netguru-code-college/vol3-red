class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, :surname, :email, presence: true
  has_many :apartment_users
  has_many :apartments, through: :apartment_users

  def admin?
    is_admin = false
    self.apartment_users.map do |apartment_user|
      if apartment_user.status == 'admin' 
        is_admin = true
      end
    end
    is_admin
  end

  def admin=(admin)
    is_admin = admin ? true : false
    self.apartment_users.map do |apartment_user|
      if is_admin
        apartment_user.status = 'admin'
        apartment_user.save!
      end
    end
  end

  after_create :create_and_associate_apartment, on: :create

  mount_uploader :thumbnail, ThumbnailUploader
  validates_integrity_of  :thumbnail
  validates_processing_of :thumbnail
 
  private
    def avatar_size_validation
      errors[:thumbnail] << "should be less than 500KB" if thumbnail.size > 0.5.megabytes
    end

    def create_and_associate_apartment
      apartment = Apartment.create!(
        apartment_number: 1,
        building_id: 1
      )
      ApartmentUser.create!(
        apartment: apartment,
        user: self,
        status: 1
      )
    end  
end
