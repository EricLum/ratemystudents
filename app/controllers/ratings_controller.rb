class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      redirect_to rating_path(@rating)
    else
      flash[:error] = @rating.errors.full_messages
      redirect_to new_rating_path
    end
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def index
    @ratings = Rating.all
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
    params.require(:rating).permit(:discipline, :learning_style, :grit, :gpa, :subject)
  end
end
