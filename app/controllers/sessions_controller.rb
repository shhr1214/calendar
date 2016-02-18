class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  helper_method :current_user

  def new
  end

  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:pass])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid account."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
