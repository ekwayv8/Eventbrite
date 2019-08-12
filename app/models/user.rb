class User < ApplicationRecord
	#Permet d'envoyer un email à l'utilisateur juste après la création de son compte
	after_create :welcome_send

	has_many :attendances
	has_many :events, through: :attendances
	has_many :created_events,  foreign_key: 'admin_id', class_name: "Event"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
