class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:redirect_url] || root_path
      flash[:notice] = 'LogIn completed!'
    else
      flash.now[:alert] = 'Entered incorrect login or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:redirect_url] = nil
    redirect_to login_path, notice: 'LogOut completed!'
  end
end
