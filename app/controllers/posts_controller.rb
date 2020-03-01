# frozen_string_literal: true

# Posts controller
class PostsController < ApplicationController
  before_action :set_post, only: %i[ show destroy ]

  def index
    # Fetch all posts in reverse chronological order
    @posts = Post.order(created_at: :desc).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = t('.success')
      redirect_to @post
    else
      flash[:error]  = t('.error')
      render :new
    end
  end

  def destroy
    @post.destroy

    flash[:notice] = t('.success')
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
