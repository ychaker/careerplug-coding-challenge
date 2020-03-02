# frozen_string_literal: true

# Comments controller
class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      flash.now[:notice] = t('.success')
    else
      flash.now[:error] = t('.error')
    end
  end

  def destroy
    @post.comments.destroy(params[:id])
    flash.now[:notice] = t('.success')
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.includes(:comments).find(params[:post_id])
  end
end
