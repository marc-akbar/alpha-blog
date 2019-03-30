class SessionsController < ApplicationController

  def new
  end

  def create
    # Creates new session with user if user authentication passes
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # If authentication passes, session user is user id
      session[:user_id] = user.id
      flash[:success] = "Login successful"
      # Redirects to user page
      redirect_to user_path(user)
    else
      # If not successful return to login page
      flash.now[:danger] = "Email and/or password was incorrect"
      render 'new'
    end
  end

  def destroy
    # Set session user to nil to end session
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end


end
