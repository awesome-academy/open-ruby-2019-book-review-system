class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = current_user.comments.build(comment_params.merge(post_id: @post.id))
    respond_to do |format|
      if @comment.save
        format.html{redirect_to @post, notice: t(".success")}
        format.js
      else
        format.html{redirect_to @post, notice: t(".fail")}
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
