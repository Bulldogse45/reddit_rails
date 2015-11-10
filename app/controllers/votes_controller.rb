class VotesController < ApplicationController

  def index
    redirect_to root_path
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.save
  end

  def use_link
    @vote = Vote.new(vote_params)
    @vote.save
    redirect_to @vote.link.location
  end

  def existing_link_vote
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    redirect_to root_path
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    redirect_to root_path
  end

  private

  def vote_params
    params.permit(:link_id)
  end
end
