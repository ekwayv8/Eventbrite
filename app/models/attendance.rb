class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event
	after_create :new_attendee_send

  def new_attendee_send
  	UserMailer.new_attendee_email(self).deliver_now
  end
end
