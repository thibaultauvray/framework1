class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  private
  def set_locale
  	if cookies[:lang].blank?
  		cookies[:lang] = "fr"
  		I18n.locale = "fr"
  	else
  		I18n.locale = cookies[:lang]
  	end
  end
end
