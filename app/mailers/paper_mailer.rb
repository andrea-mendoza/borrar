class PaperMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.paper_mailer.status_notification.subject
  #
  default from: 'Sistema de Revisión de Documentos <doc.reviewer.app@gmail.com>'

  def status_notification(paper_user, paper, event)
    @paper_email = paper_user.email
    @paper = paper
    @event = event
    attachments.inline["ucb_valores.png"] = File.read("#{Rails.root}/app/assets/images/ucb_valores.png")

    mail(to: @paper_email, subject: 'Cambio de estado')
  end
end
