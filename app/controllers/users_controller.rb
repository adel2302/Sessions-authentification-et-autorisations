class UsersController < ApplicationController
  def home
  	if session[:user_id]
    @user = User.find(session[:user_id])
    end

  end

  def login
  	session[:test] = "Valeur de test"
  end

  def check
    @user = User.where(name: params[:name], password: params[:password]).first
    if @user
      session[:user_id] = @user.id
      flash[:info] = "Bienvenue #{@user.name} !"
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

end
