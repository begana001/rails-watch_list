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

  def edit
    @list = List.find(params[:list_id])
    @list_comment = ListComment.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @list_comment = ListComment.find(params[:id])
    if @list_comment.update(list_comment_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list_comment = ListComment.find(params[:id])
    @list_comment.destroy
    redirect_to list_path(@list_comment.list)
  end

  private

  def list_comment_params
    params.require(:list_comment).permit(:comment)
  end
end
