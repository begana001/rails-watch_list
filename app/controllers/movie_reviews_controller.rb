class MovieReviewsController < ApplicationController
  def index
    @movie = Movie.all
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movie_review = MovieReview.new(movie_review_params)
    @movie_review.movie = @movie
    if @movie_review.save
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  private

  def movie_review_params
    params.require(:movie_review).permit(:comment, :rating, :movie_id)
  end
end
