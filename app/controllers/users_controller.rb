# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, success: "Konto erfolgreich erstellt!"
    else
      flash.now[:alert] = "Unknown error!"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation)
  end
end
