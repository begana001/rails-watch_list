class ListLikesController < ApplicationController
  def create
    @list_like = ListLike.create(list_like_params)
    @list = List.find(:list_id)
    @list_like.list = @list
    @list_like.save
  end

  private

  def list_like_params
    require.param(:list_like).permit(:user_id, :list_id)
  end
end
