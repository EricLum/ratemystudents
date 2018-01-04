class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
   @comment = Comment.new
   #@teachers = Teacher.all
   @teacher = current_teacher
   @students = Student.all
  end

  def show
   @comment = Comment.find(params[:id])
  end

  def create
   @comment = Comment.new(comment_params)
   if @comment.valid?
     @comment.save
     redirect_to new_rating_path
   else
    flash[:error] = @comment.errors.full_messages
    redirect_to new_comment_path
   end
  end

  def edit
    @comment = Comment.find(params[:id])
    #@teachers = Teacher.all
    @teacher = current_teacher
    @students = Student.all
  end

  def update
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to @comment
    else
     flash[:error] = @comment.errors.full_messages
     redirect_to edit_comment_path
    end
   end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :student_id, :teacher_id)
  end


end
