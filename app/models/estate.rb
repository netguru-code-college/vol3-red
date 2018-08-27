class Estate < ApplicationRecord
  validates :name, presence: true
  has_many :buildings
  has_many :apartments, through: :buildings
end
