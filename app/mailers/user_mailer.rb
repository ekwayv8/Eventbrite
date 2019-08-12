class UserMailer < ApplicationMailer

default from: 'no-reply@evenbrite-project.herokuapp.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://evenbrite-project.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue dans le futur! Enjoy') 
  end

  def new_attendee_email(attendance)
  	
    @attendance = attendance
    @admin = User.find(Event.find_by(id: Attendance.all.last.event_id).admin_id)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://evenbrite-project.herokuapp.com/events/#{event.id}' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Super! Un nouveau participant sera présent à ton prochain évenement') 
  end
end
