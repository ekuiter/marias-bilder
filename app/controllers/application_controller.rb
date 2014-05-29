class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
    def admin_required
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == Settings.get('admin.username') && password == Settings.get('admin.password')
      end
      @admin = true
    end
end

class String
  
  def urlify
    downcase.gsub(' ', '-')
  end
  
end