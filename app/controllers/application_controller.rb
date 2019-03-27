class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    # Return the user that already exists, if not, search the database for user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Convert to a boolean. Returns true or false whether there is a current user or not
    !!current_user
  end

  def require_user
    # If not logged in
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
