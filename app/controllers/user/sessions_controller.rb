# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :check_user, only: [:create] #ログイン制限
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
  # ログイン制限
  def check_user
    user = User.find_by(email: params[:user][:email])
    return if !user
    if user.valid_password?(params[:user][:password]) && user.is_deleted
      redirect_to new_user_session_path
    end
  end
end
