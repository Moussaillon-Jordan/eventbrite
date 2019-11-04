class User < ApplicationRecord
  validates :email,  presence: true,  uniqueness: true,  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Format email incorrect" }
  validates :encrypted_password, presence: true

  has_many :attendances
  has_many :events, through: :attendances
  has_many :organized_events, foreign_key: 'orga_id', class_name: "Event"
end
