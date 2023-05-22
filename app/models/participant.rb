class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :raffle
  has_many :tickets
  has_one :winner
end
