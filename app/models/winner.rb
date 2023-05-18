class Winner < ApplicationRecord
  belongs_to :raffle
  belongs_to :participant
  belongs_to :prize
  validates :place, :drawing_date, presence: true
  validates :place, numericality: { only_integer: true }
end
