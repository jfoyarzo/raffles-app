class Raffle < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_one_attached :image
end
