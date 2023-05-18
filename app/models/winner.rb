class Winner < ApplicationRecord
  belongs_to :raffle
  belongs_to :participant
  belongs_to :prize
end
