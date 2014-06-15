class ContactMailer < ActionMailer::Base
  #default to: "samdair@yahoo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.message.subject
  #
  def new_message(message)
    @message = message
    mail(:to     => "samdair@yahoo.com",
    :subject  =>  message.subject,
    :from =>   message.email     
    )
end
end