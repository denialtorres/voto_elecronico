class PetitionMailer < ApplicationMailer
  default from: ENV['notification_email']

  def petition_successfully_created(petition_id)
    @petition = Petition.find(petition_id)

    mail(to: @petition.creator_email, subject: 'Tu petición ha sido creada')
  end

end
