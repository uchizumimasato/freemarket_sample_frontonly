class RegistrationsController < ApplicationController
  before_action :session_set, only: [:second, :forth]
  before_action :login_to_root, only: :new

  def new
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
