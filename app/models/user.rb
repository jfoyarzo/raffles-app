class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :raffles
  has_many :participants
  has_one_attached :avatar
  validates :full_name, presence: true
  validates :full_name, length: { in: 5..50 }
end
