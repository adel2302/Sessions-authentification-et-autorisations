class UsersController < ApplicationController

  def home
  end

  def login
  end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = " Bienvenue #{@current_user.name} !"
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/users/home"
  end

  def liste
   unless @current_user.try(:role) == "admin"
     flash[:error] = "Accès interdit"
     redirect_to request.referrer || root_path	
   end
    @users =User.all
  end
end