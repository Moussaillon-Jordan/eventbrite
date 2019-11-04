class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :participate_send

  def participate_send
    AttendanceMailer.participate_email(self).deliver_now
  end

end
