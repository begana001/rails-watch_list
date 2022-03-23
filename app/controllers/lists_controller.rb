class ListsController < ApplicationController
  def home
    # order lists by list_likes 
    @popular_lists = List.includes(:list_likes).sort{|a, b| b.list_likes.size <=> a.list_likes.size}
    @list = List.new
    @movies = Movie.order(rating: :desc)
    @movie_reviews = MovieReview.order(created_at: :desc)
  end

  def profile
    @account = current_user
  end

  def like
    # grep a list
    @list = List.find(params[:id])
    # create like with user id and list id
    ListLike.create(user_id: current_user.id, list_id: @list.id )
    redirect_to list_path(@list)
  end

  def index
    @lists = List.order(like: :desc)
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @list_comment = ListComment.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render 'new'
    end    
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :photo)
  end
end
