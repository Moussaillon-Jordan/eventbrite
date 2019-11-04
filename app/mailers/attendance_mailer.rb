class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def participate_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance
    @event = Event.find(@attendance.event_id)
    @orga = User.find(@event.orga_id)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @orga.email, subject: "Quelqu'un participe à votre Event !")
  end
end
