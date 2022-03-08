class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search_by_title(params[:query])
    else
      @movies = Movie.all
      # get 6 random movies
      @new_movies = Movie.all.sample(6)
      @movie_reviews = MovieReview.all
      @crew_picks = Movie.all.sample(10)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_review = MovieReview.new
  end
end
