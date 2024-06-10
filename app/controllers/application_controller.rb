class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :authenticate_user!, except: [:home, :about] # ログインしていない場合、ログイン画面にリダイレクト
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後にユーザーのプロフィールページにリダイレクト
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(resource) # サインアップ後にユーザーのプロフィールページにリダイレクト
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
