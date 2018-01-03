class TeachersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def show
    if logged_in?
      flash[:msg] = "Welcome #{current_teacher.username}"
    else
    end
    @teacher = Teacher.find(session[:teacher_id])
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.valid?
      @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      flash[:error] = @teacher.errors.full_messages
      redirect_to new_teacher_path
    end
  end

  private

  def set_teacher
   @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:username, :password)
  end
end
