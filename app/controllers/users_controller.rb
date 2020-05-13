class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, success: "Successfully registered!"
    else
      flash.now[:alert] = "Unknown error!"
      render "new"
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation)
  end
end
