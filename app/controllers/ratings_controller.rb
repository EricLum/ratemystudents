class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @students = Student.all
  end

  def create
    @rating = Rating.new(rating_params)
    #Create comment to create teacher association
    # @comment = Comment.new
    # @comment.content = rating_params[:comment_description]
    # @comment.student = Student.find(rating_params[:student_ids])
    # @comment.teacher = current_teacher
    # @comment.save

    if @rating.save
      redirect_to rating_path(@rating)
    else
      flash[:error] = @rating.errors.full_messages
      redirect_to new_rating_path
    end
  end

  def show
    @rating = Rating.find(params[:id])
    @student = Student.find(params[:id])
  end


  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to rating_path(@rating)
    else
      flash[:error] = @rating.errors.full_messages
      redirect_to edit_rating_path(@rating)
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to ratings_path
  end


  private

  def rating_params
    params.require(:rating).permit(:discipline, :learning_style, :grit, :gpa, :subject, student_ids: [], students_attributes: [:name])
  end
end
