class ListsController < ApplicationController
  def home
    @lists = List.all
    @list = List.new
    @movies = Movie.all
    @movie_reviews = MovieReview.all
  end

  def index
    @lists = List.order(like: :desc)
  end

  def show
    @list = List.find(params[:id])
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
    params.require(:list).permit(:name, :description)
  end
end
