class Raffle < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :prizes
  has_many :tickets
  has_many :winners
  has_one_attached :image
end
