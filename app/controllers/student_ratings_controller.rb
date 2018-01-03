class StudentRatingsController < ApplicationController

  def index
    @studentratings = StudentRatings.all
  end
end
