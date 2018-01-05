class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @current_like = Like.find_by(comment_id: like_params[:comment_id], teacher_id: like_params[:teacher_id])

    if @current_like
      @comment = @current_like.comment
      @current_like.destroy
    else
      @like = Like.new(like_params)
      if @like.valid?
        @like.save
        @comment = @like.comment
      else
        #do nothing
      end
    end
    redirect_to comment_path(@comment)
  end


  private

  def like_params
    params.require(:like).permit(:comment_id, :teacher_id)
  end
end
