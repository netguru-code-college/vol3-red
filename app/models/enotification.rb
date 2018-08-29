class Enotification < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 300 }
  validates :valid_up_to_date, presence: true
  validate :valid_up_to_date_cannot_be_in_the_past

  def valid_up_to_date_cannot_be_in_the_past
    errors.add("can't be in the past") if valid_up_to_date.present? &&
                                          valid_up_to_date < Date.today
  end

  belongs_to :estate
  default_scope -> { order(:valid_up_to_date) }
end
