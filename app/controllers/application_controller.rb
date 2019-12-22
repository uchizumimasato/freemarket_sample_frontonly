class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth
  helper_method :current_user
  helper_method :login_required
  helper_method :user_signed_in?
  helper_method :item_soldout?
  helper_method :login_to_root

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mercari' && password == 'aaaa'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to new_session_path unless current_user
  end

  def user_signed_in?
    if current_user
      return true
    else
      return false
    end
  end

  def item_soldout?(item)
    if item.transaction_status == 3
      return true
    else
      return false
    end
  end

  def login_to_root
    redirect_to root_path if user_signed_in?
  end
end
