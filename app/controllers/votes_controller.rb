class VotesController < ApplicationController

# before_action :locate_post only: :upvote

  def new
    @vote = Vote.new
  end

  # def create
  #   @vote = Vote.new(vote_params)
  #   if @vote.save
  #     redirect_to :root
  #   end
  # end

  # def upvote
  #   @post = Post.find(params[:id])
  #   @post.votes.new(post_id: @post.id, user_id: current_user.id)
  #   if @post.save
  #     redirect_to :root
  #   end
  # end
  #
  # def downvote
  #   @vote = Vote.find(params[:post])
  #   @vote.destroy
  #   redirect_to :root
  # end

  # def destroy
  #   @vote = Vote.find(params[:post])
  #   @vote.destroy
  #   redirect_to :root
  # end

private

  def locate_post
    @post = Post.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:user, :post)
  end

end
