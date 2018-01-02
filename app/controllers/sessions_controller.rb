class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
  end

  def create
<<<<<<< HEAD

    @teacher = User.find_by(username: params[:username])
    if @teacher && @teacher.authenticate(params[:password])
=======
    @teacher = Teacher.find_by(username: params[:username])
    if @teacher && @teacher.authenticate(params[:password])
      # YOU ARE WHO YOU SAY YOU ARE
>>>>>>> e9b0b43bc8cdedd61025d5aab9508a86baf27cae
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      flash[:error] = ["Username and password do not match"]
      redirect_to signin_path
    end
  end

  def destroy
<<<<<<< HEAD
    session[:teacher_id] = nil
    redirect_to login_path
=======
    # get logged out
    session[:teacher_id] = nil
    # redirect to login
    redirect_to signin_path
>>>>>>> e9b0b43bc8cdedd61025d5aab9508a86baf27cae
  end
end
