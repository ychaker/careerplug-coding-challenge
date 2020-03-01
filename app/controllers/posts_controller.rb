# frozen_string_literal: true

# Posts controller
class PostsController < ApplicationController
  before_action :set_post, only: %i[ show destroy ]

  def index
    # Fetch posts in reverse chronological order
    @posts = Post.order(created_at: :desc)

    # If a search term has been passed, use it to filter the results
    # rubocop:disable Style/SafeNavigation
    # rubocop:disable Style/IfUnlessModifier
    if params[:q] && params[:q].present?
      @posts = @posts.search_by_title_and_body(params[:q])
    end
    # rubocop:enable Style/IfUnlessModifier
    # rubocop:enable Style/SafeNavigation

    # Then ultimately paginate
    @posts = @posts.page params[:page]
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
      flash[:error] = t('.error')
      render :new
    end
  end

  def show; end

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
