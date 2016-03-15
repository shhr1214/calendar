class UsersController < ApplicationController
  protect_from_forgery except: [:update]
  skip_before_action :authenticate_user!, only: %i(new create)
  before_action :set_user, only: %i(show edit update destroy)

  def new
    @user = User.new
    @user.auth = :normal
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created!!'
      #format.json {}
    else
      render 'new'
      #format.html
      #format.json
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully created!!' }
        #format.json {}
      else
        #format.html
        #format.json
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url , notice: 'User was successfully deleted!!' }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :employee_id, :auth, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end