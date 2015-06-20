class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, except: :email_callback

  def email_callback
    EmailLib.email_callback params
    #render status: 200 # , json: @controller.to_json
    head :ok
  end
end
