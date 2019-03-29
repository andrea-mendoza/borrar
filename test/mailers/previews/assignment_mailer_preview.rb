# Preview all emails at http://localhost:3000/rails/mailers/assignment_mailer
class AssignmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/assignment_mailer/tribunal_confirmation
  def tribunal_confirmation
    AssignmentMailer.tribunal_confirmation
  end

end
