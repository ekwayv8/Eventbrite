class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	#Permet d'envoyer un email à l'utilisateur juste après la création de son compte
	after_create :welcome_send

	has_many :attendances
	has_many :events, through: :attendances
	has_many :created_events,  foreign_key: 'admin_id', class_name: "Event"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
