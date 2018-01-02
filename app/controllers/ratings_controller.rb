class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end


  private

  def rating_params
    params.require(:rating).permit(:discipline, :learning_style, :grit, :gpa, :subject)
  end
end
