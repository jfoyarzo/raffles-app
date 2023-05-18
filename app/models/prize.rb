class Prize < ApplicationRecord
  belongs_to :raffle
  has_one_attached :image
end
