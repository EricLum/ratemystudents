class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create

    @teacher = User.find_by(username: params[:username])
    if @teacher && @teacher.authenticate(params[:password])
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else

      flash[:error] = ["Username and password do not match"]
      redirect_to login_path
    end
  end


  def destroy
    session[:teacher_id] = nil
    redirect_to login_path
  end
end
