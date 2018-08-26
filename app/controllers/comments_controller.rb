class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], brog_id: comment_params[:brog_id], user_id: current_user.id)
    redirect_to "/brogs/#{@comment.brog.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end
  private
  def comment_params
    params.permit(:text, :brog_id)
  end
end
