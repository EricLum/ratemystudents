class StudentsController < ApplicationController
  def index
    @students = current_teacher.students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to new_comment_path
    else
      flash[:error] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show
    @student = Student.find(params[:id])
    @ratings = Rating.all
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      flash[:error] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  def analytics
    @students = Student.all
    @top_student = Student.highest_gpa_student
    @worst_student = Student.lowest_gpa_student
    @averagegpa = Student.average_gpa
    @avg_discipline = Student.average_discipline
    @lowest_effort = Student.lowest_grit_student
    @highest_effort = Student.highest_grit_student
    @pop_learning_style = Rating.most_popular_learning_style
  end


  private

  def student_params
     params.require(:student).permit(:name)
  end
end
