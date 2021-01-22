class ContactMailer < ApplicationMailer
  def new_contact_email(contact)
    @contact = contact
    mail(to: "info@ajackus.com", subject: "New Contact Form Details")
  end
end
