class SessionsController < ApplicationController
  before_action :login_to_root, only: :new

  def new
  end

  def create
    user = User.find_by(email: sessions_params[:email])

    if user&.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path, notice: 'ログアウトしました'
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
