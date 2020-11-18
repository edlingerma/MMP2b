# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, info: "Erfolgreich eingeloggt!"
    else
      flash.now[:alert] = "Benutzername oder Passwort ist falsch"
      render "new"
    end
  end

  def create_oauth
    user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      redirect_to root_url, info: 'Erfolgreich eingeloggt!'
    else
      flash.now[:alert] = "Benutzername oder Passwort ist falsch"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, info: 'Du bist nun ausgeloggt'
  end
end
