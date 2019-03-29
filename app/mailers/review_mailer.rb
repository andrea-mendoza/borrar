class ReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_mailer.review_notification.subject
  #
  default from: 'Sistema de Revisión de Documentos <doc.reviewer.app@gmail.com>'

  def review_notification(current_user, paper_assignment, paper, event)
    @current_user = current_user
    @paper = paper
    @event = event
    @tutor_email = User.find(paper_assignment.tutor_id).email
    @relator_email = User.find(paper_assignment.relator_id).email
    @director_email = User.find(paper_assignment.director_id).email
    attachments.inline["ucb_valores.png"] = File.read("#{Rails.root}/app/assets/images/ucb_valores.png")

    mail(to: [@tutor_email, @relator_email, @director_email], subject: 'Nueva Revisión')
  end
end
