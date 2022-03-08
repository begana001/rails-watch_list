class ListCommentsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @list_comment = ListComment.new(list_comment_params)
    @list_comment.list = @list
    if @list_comment.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  private

  def list_comment_params
    params.require(:list_comment).permit(:comment)
  end
end
