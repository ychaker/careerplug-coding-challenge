# frozen_string_literal: true

# Comments controller
class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[ edit update ]

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      flash.now[:notice] = t('.success')
    else
      flash.now[:error] = t('.error')
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
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

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
