class VotesController < ApplicationController

before_action :require_login, only: [:up, :down]
before_action :locate_post, only: :up
before_action :locate_vote, only: :down

  def new
    @vote = Vote.new
  end

  def up
    @post.votes.new(post_id: @post.id, user_id: current_user.id)
    if @post.save
      redirect_to :root
    end
  end

  def down
    @vote.destroy
    redirect_to :root
  end

private

  def locate_post
    @post = Post.find(params[:id])
  end

  def locate_vote
    @post = Post.find(params[:id])
    @vote = Vote.find_by post_id: @post.id, user_id: current_user.id
  end

  def vote_params
    params.require(:vote).permit(:user, :post)
  end

end
