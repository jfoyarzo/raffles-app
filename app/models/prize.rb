class Prize < ApplicationRecord
  belongs_to :raffle
  has_one :winner
  has_one_attached :image
end
