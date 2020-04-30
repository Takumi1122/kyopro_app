class SessionsController < ApplicationController
  skip_before_action :login_required
  

  def new
    redirect_to root_path if(session[:user_id]) 
  end

  def login
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  def logout
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
