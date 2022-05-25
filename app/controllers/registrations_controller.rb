class RegistrationsController < ApplicationController
  # instantiates new user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new, notice: ""
    end
  end

  private

  def user_params
    # strong parameters
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end