class AdminMessageMailer < ActionMailer::Base

  add_template_helper ApplicationHelper

  default from: 'mail@markwigg.com'


  def send_mail_to_contact(contact)

    # assign the settings, to be used here and in the contact_mailer
    @settings = AdminEmail.first

    @contact = contact

    @url = 'localhost:3000'
    mail(to: @contact.email, subject: @settings.subject)

  end

  def send_mail_copy(contact)

    @contact = contact

    # assign the settings, to be used in the contact_mailer
    @settings = AdminEmail.first
    mail(to: 'markbwigglesworth02@gmail.com', subject: 'Website Message')

  end




end
