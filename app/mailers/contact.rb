class Contact < ActionMailer::Base

  attr_accessor :name, :email, :msg

  default to: "maria@marias-bilder.de",
          from: "maria@marias-bilder.de"

  headers = {'Return-Path' => 'contact@myapp.com'}

  def send_email(user_info)
    @user_info = user_info

    mail(
      to: "elias.kuiter@outlook.com",
      subject: "marias-bilder.de - Kontaktformular",
      from: "marias bilder <marias-bilder.de>",
      return_path: "maria@marias-bilder.de",
      date: Time.now,
      content_type: "text/html"
    )
  end
end