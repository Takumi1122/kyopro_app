class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    redirect_to root_path if(session[:user_id]) 
    @user = User.new
    render layout: false
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new, layout: false
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
