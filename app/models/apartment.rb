class Apartment < ApplicationRecord
  validates :apartment_number, presence: true,
            format: { with: /\A\d+\z/,
                      message: "Integer only. No sign allowed." },
            length: { in: 1..4 }
  belongs_to :building
end
