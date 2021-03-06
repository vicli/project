module SessionsHelper

  #Logs in user
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    user = User.find(params[:id])

    unless logged_in? && user == current_user
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
