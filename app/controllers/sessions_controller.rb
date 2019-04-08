class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'LogIn completed!'
      # не работает redirect
      # session[:url].present? ? (redirect_to session[:url]) : (redirect_to root_path)
    else
      flash.now[:alert] = 'Entered incorrect login or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:url] = nil
    redirect_to login_path, notice: 'LogOut completed!'
  end
end
