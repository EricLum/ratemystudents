class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorized
  helper_method :logged_in?

  def current_teacher
    if session[:teacher_id]
      Teacher.find(session[:teacher_id])
    else
    end
  end

  def logged_in?
    !!current_teacher
  end

  def authorized
    if !logged_in?
      redirect_to signin_path
    end
  end

end
