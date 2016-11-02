class CommentsController < ApplicationController

  before_action :locate_post, only: [:index, :show, :new, :create]
  before_action :require_login, only: [:create, :new]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = "Thanks!"
      redirect_to post_comments_path(@comment.post_id)
    else
      render :new
    end
  end

  def show
    @comments = []
    @comments << Comment.find_by(post_id: @post.id)
  end

  private

  def locate_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user, :post)
  end

end
