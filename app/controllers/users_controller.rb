class UsersController < ApplicationController
  def home
  end

  def login
  end

  def check
    @user = User.where(name: params[:name], password: params[:password]).first
    if @user
      flash[:info] = "Bienvenue #{@user.name} !"
      redirect_to "/users/home"
    else
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end
end
