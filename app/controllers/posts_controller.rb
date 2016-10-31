class PostsController < ApplicationController

  before_action :locate_post, only: [:upvote, :downvote, :visit]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def upvote
    @post.vote_count = 0 unless @post.vote_count
    @post.vote_count += 1
    @post.save
    redirect_to root_path
  end

  def downvote
    @post.vote_count -= 1
    @post.save
    redirect_to root_path
  end

  def visit
    @post.vote_count += 1
    @post.save
    redirect_to @post.url
  end

  private

  def locate_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :vote_count, :user_id)
  end

end
