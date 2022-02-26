class MovieReviewsController < ApplicationController
  def index
    @movie_reviews = MovieReview.all
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

  def edit
    @movie = Movie.find(params[:movie_id])
    @movie_review = MovieReview.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @movie_review = MovieReview.find(params[:id])

    if @movie_review.update(movie_review_params)
      redirect_to movie_path(@movie_review.movie)
    else
      render 'movies/show'
    end
  end

  private

  def movie_review_params
    params.require(:movie_review).permit(:comment, :rating, :movie_id)
  end
end
