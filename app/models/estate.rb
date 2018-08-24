class Estate < ApplicationRecord
  validates :name, presence: true
  has_many :buildings
end
