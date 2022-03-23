class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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

  def like
    # grep a movie
    @movie = Movie.find(params[:id])
    # create like with user id and list id
    MovieLike.create(user_id: current_user.id, movie_id: @movie.id )
    redirect_to movie_path(@movie)
  end
end
