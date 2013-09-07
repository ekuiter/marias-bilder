class ContactForm < MailForm::Base
  
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

  def headers
    {
      subject: "marias-bilder.de - Kontaktformular",
      to: "maria@marias-bilder.de",
      from: "\"#{name}\" <#{email}>"
    }
  end
end