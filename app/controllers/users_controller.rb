class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: '登録に成功しました' }
     #   format.json {}
      else
     #   format.html
     #   format.json
      end
    end
  end
end