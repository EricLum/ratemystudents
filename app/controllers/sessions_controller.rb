class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
  end

  def create

    @teacher = Teacher.find_by(username: params[:username])
    if @teacher && @teacher.authenticate(params[:password])
      # YOU ARE WHO YOU SAY YOU ARE
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      flash[:error] = ["Username and password do not match"]
      redirect_to signin_path
    end
  end

  def destroy
    # get logged out
    session[:teacher_id] = nil
    # redirect to login
    redirect_to signin_path
  end
end
