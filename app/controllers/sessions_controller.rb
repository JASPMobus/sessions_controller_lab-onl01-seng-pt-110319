class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:name]
    if logged_in?
      redirect_to root_path
    elsif name && name != ""
      session[:name] = params[:name]
      
      redirect_to root_path
    else
      redirect_to session_new_path
    end 
  end

  def destroy
    session.delete :name
    
    redirect_to session_new_path
  end
end
