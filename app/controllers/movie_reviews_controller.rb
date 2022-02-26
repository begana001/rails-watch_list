class MovieReviewsController < ApplicationController
  def index
    @movie_reviews = MovieReview.all
  end

  def new
    @movie_review = MovieReview.new
  end

  def create
    @movie_review = MovieReview.new(movie_review_params)
  end

  private

  def movie_review_params
    params.require(:movie_review).permit(:comment, :rating)
  end
end
