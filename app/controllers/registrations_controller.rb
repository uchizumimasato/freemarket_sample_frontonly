class RegistrationsController < ApplicationController
  before_action :session_set, only: [:second, :forth]
  before_action :login_to_root, only: :new

  def new
  end

  def sns
    if params[:provider] == 'facebook'
      @facebook = params[:provider]
      @user_name = request.env["omniauth.auth"][:extra][:raw_info][:name]
      @email = request.env["omniauth.auth"][:extra][:raw_info][:email]
      render template: 'registrations/first'
    elsif params[:provider] == 'google_oauth2'
      unless SnsCredential.find_by(uid: request.env["omniauth.auth"][:uid])
        # 新規登録
        user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'ログインしました'
      else
        # ログイン
        sns = SnsCredential.find_by(uid: request.env["omniauth.auth"][:uid])
        session[:user_id] = sns.user.id
        redirect_to root_path, notice: 'ログインしました'
      end
    end
  end

  def first
    @user = User.new
    reset_session
  end

  def second
  end

  def third
  end

  def forth
  end

  def fifth
    user = User.create(nickname: session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], name: session[:name], name_kana: session[:name_kana], postal_code: session[:postal_code], prefecture: session[:prefecture], city: session[:city], address: session[:address])
    reset_session
    session[:user_id] = user.id
    login_required
  end

  private

  def registrations_params
    params.permit(:nickname, :email, :password, :password_confirmation, :name, :name_kana, :postal_code, :prefecture, :city, :address)
  end

  def session_set
    registrations_params.each do |key, value|
      session[key] = value
    end
  end
end
