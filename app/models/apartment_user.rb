class ApartmentUser < ApplicationRecord
  enum status: [ :owner, :tenant, :admin ]
  validates :user, :apartment, :status, presence: true
  belongs_to :apartment
  belongs_to :user
end
