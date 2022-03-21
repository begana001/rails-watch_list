class MovieLikesController < ApplicationController
  def create
    @movie_like = ListLike.create(movie_like_params)
    @movie = Movie.find(:movie_id)
    @movie_like.list = @movie
    @movie_like.save
  end

  private

  def movie_like_params
    require.param(:movie_like).permit(:user_id, :movie_id)
  end
end
