class UserContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_contact_mailer.notification.subject
  #
  def notification(contact_message)
    # add sender_name to contact_messages tabel
    @sender_name = contact_message.user.first_name
    @sender_email = contact_message.sender_email
    @sender_subject = contact_message.sender_subject
    @sender_message = contact_message.sender_message
    @recipient_email = contact_message.recipient_email
    @recipient_idea_title = contact_message.recipient_idea_problem_title
    @recipient_idea_id = contact_message.recipient_idea_problem_id

    mail to: @recipient_email, bcc: @sender_email, subject: "You have a email from another User!"
  end
end
