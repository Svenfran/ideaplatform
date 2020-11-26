# Preview all emails at http://localhost:3000/rails/mailers/user_contact_mailer
class UserContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_contact_mailer/notification
  def notification
    contact_message = ContactMessage.last
    UserContactMailer.notification(contact_message)
  end

end
