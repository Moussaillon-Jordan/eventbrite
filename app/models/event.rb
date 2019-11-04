class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :orga, class_name: "User"

#  def is_past?(event)
#    return Time.parse(event.start_date) <= Time.now
#  end

#  def is_positive_modulo_5?(duration)
#    duration = Event.find(:id).duration
#    return duration % 5 == 0 && duration > 0
#  end

end
