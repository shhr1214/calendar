class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :id_invalid
  before_action :authenticate_user!

  def id_invalid(e)
    render 'shared/record_not_found', status: 404
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    unless session[:user_id]
      redirect_to new_session_path
    end
  end

  def user_signed_in?
    !!current_user
  end

  helper_method :current_user
  helper_method :user_signed_in?
  
end
