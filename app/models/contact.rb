class Contact < ApplicationRecord

  validates :first_name, :presence => true, format: {with: /[a-zA-Z]/}
  validates :last_name, :presence => true, format: {with: /[a-zA-Z]/}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :phone, :presence => true,
                    :numericality => true,
                    :length => { :minimum => 5, :maximum => 15 }

  def send_mail
    ContactMailer.new_contact_email(self).deliver_now
  end
                    
end
