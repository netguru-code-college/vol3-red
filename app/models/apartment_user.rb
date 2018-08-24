class ApartmentUser < ApplicationRecord
  enum status: [ :owner, :tenant, :admin ]
  validates :user, :apartment, :status, presence: true
  belongs_to :user
  belongs_to :apartment
end
