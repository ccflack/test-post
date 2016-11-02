class PostsController < ApplicationController

  before_action :locate_post, only: :visit
  before_action :require_login, only: [:create, :new]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      tag_names = params[:post][:tag_names].split(",")
      tag_names = tag_names.collect(&:strip)
      tag_names.each do |name|
        @post.tags << Tag.find_or_initialize_by(name: name)
      end
      flash[:success] = "Thanks!"
      redirect_to :root
    else
      render :new
    end
  end

  def visit
    if current_user
      @post.votes.new(post_id: @post.id, user_id: current_user.id)
      @post.save
    end
    redirect_to @post.url
  end

  private

  def locate_post
    @post = Post.find(params[:id])
  end

  def locate_vote
    @post = Post.find(params[:id])
    @vote = Vote.find_by post_id: @post.id
  end

  def post_params
    params.require(:post).permit(:title, :url, :user_id, :category_id, :tag)
  end

end
