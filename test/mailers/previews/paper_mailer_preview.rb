# Preview all emails at http://localhost:3000/rails/mailers/paper_mailer
class PaperMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/paper_mailer/status_notification
  def status_notification
    PaperMailer.status_notification
  end

end
