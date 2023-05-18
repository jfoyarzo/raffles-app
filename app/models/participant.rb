class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :raffle
  has_one :winner
end
