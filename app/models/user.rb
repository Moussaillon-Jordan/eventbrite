class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,  presence: true,  uniqueness: true,  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Format email incorrect" }
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :attendances
  has_many :events, through: :attendances
  has_many :organized_events, foreign_key: 'orga_id', class_name: "Event"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
