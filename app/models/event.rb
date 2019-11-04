class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true, :numericality { :greater_than: 0}
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  validate :is_future?
  validate :is_multiple_5?

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :orga, class_name: "User"

  def is_future?
    errors.add(:start_date, "La date de départ ne peut être passée") unless Time.parse(self.start_date) > Time.now
  end

  def is_multiple_5?
    errors.add(:duration, "La durée (minutes) doit être multiple de 5") unless self.duration % 5 == 0
  end

end
