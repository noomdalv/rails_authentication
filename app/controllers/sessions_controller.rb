class SessionsController < ApplicationController

  def new
    sign_out
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user #creates a session[:user_id]
      remember(@user)
      set_current_user @user
      flash[:success] = 'Welcome!'
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    flash[:success] = 'Logout succesful!'
    redirect_to root_url
  end
end
