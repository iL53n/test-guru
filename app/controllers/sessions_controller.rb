class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:url].present? ? (redirect_to session[:url]) : (redirect_to root_path)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:url] = nil
    redirect_to root_path, noice: 'LogOut completed!'
  end
end
