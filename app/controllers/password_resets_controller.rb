class PasswordResetsController < ApplicationController

  def new; end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: :password_reset)
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your password was reset successfully. Please sign in'
    else
      render :edit
    end
  end

  def create
    user = User.find_by_email(params[:email])
    return redirect_to password_reset_path, alert: 'Can\'t find email!' if user.nil?

    signed_user_id = User.find_by_email(params[:email]).signed_id(purpose: :password_reset)
    redirect_to password_reset_edit_path token: signed_user_id
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end