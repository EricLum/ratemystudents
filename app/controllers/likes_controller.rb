class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    if @like.valid?
      @like.save
    else
      #do nothing
    end
    redirect_to comment_path(@like.comment)
  end

  private

  def like_params
    params.require(:like).permit(:comment_id, :teacher_id)
  end
end
