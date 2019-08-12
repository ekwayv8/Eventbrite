class Event < ApplicationRecord
    
    belongs_to :admin, class_name: "User"
    has_many :attendances
    has_many :users, through: :attendances

	#Validation de la la date de début dont la présence est obligatoire, et il est impossible de créer ou modifier un événement dans le passé
	validates :start_date,
	 presence: true,
    numericality: { greater_than_or_equal_to: Time.now.to_i }

	#Validation de la durée d'un évenement : présence obligatoire et le nombre de minutes doit être un multiple de 5, et est strictement positif
	validates :duration,
    presence: true,
    numericality: { greater_than: 0, only_integer: true }
    #il faut préciser que cet integer doit être un multiple de 5.

    #Validation des titres dont le présence est obligatoire et qui doivent faire au moins 5 caractères et maxi 140 caractères
    validates :title,
    presence: true,
    length: { in: 5..140 }

    #Validation des titres dont le présence est obligatoire et qui doivent faire au moins 20 caractères et maxi 1000 caractères
    validates :description,
    presence: true,
    length: { in: 20..1000 }

    #Validation des prix dont le présence est obligatoire et qui doivent être des integer compris entre 1 et 1000
    validates :price,
    presence: true,
    numericality: { only_integer: true, in: 1..1000 }
    #il faut préciser que cet integer doit être compris entre 1 et 1000. (pas d'événement gratuit pour cette première version de l'application)
    
    #Validation de la localisation de l'event dont le présence est obligatoire
    validates :location,
    presence: true


end
