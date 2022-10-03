module ApplicationHelper
  def require_user
    if !user_signed_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to users_path
    end
  end
  def logged_in?
      !!current_user
  end
end
