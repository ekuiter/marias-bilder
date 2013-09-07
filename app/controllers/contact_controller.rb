class ContactController < ApplicationController

  def index
  end

  def dispatch_email
    user_info = params[:user_info]
    if Contact.send_email(user_info).deliver
      flash[:notice] = "Nachricht gesendet!"
    else
      flash[:notice] = "Nachricht konnte nicht gesendet werden."
    end
    redirect_to contact_url
  end

end