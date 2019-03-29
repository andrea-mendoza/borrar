class AssignmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.assignment_mailer.tribunal_confirmation.subject
  #
  default from: 'Sistema de Revisión de Documentos <doc.reviewer.app@gmail.com>'

  def tribunal_confirmation(assignment, paper, event)
    @tutor_email = User.find(assignment.tutor_id).email
    @relator_email = User.find(assignment.relator_id).email
    @director_email = User.find(assignment.director_id).email
    @paper = paper
    @event = event
    attachments.inline["ucb_valores.png"] = File.read("#{Rails.root}/app/assets/images/ucb_valores.png")

    mail(to: [@tutor_email, @relator_email, @director_email], subject: 'Tribunal asignado')
  end
end
