class PostsController < ApplicationController

  before_action :locate_post, only: [:upvote, :downvote, :visit]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(item_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def upvote
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

  def show

  end

  private

  def locate_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url)
  end

end
