class UsersController < ApplicationController
  protect_from_forgery except: [:update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created!!' }
        #format.json {}
      else
        #format.html
        #format.json
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created!!' }
        #format.json {}
      else
        #format.html
        #format.json
      end
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :employee_id, :password, :auth)
  end

  def set_user
    @user = User.find(params[:id])
  end
end