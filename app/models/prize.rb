class Prize < ApplicationRecord
  belongs_to :raffle
  has_one :winner
  has_one_attached :image
  validates :name, :place, presence: true
  validates :place, numericality: { only_integer: true }
  validates :name, length: { in: 5..30 }
end
