class Raffle < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :prizes
  has_many :tickets
  has_many :winners
  has_one_attached :image
  validates :name, :description, :start_date, :end_date, :drawing_date, :max_tickets, presence: true
  validates :max_tickets, numericality: { only_integer: true }
  validates :end_date, comparison: { greater_than: :start_date }
  validates :name, length: { in: 5..30 }
end
