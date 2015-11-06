class VotesController < ApplicationController

  def index
    redirect_to root_path
  end
  def create
    vote = Vote.create(vote_params)
    redirect_to root_path
  end
  def use_link
    vote = Vote.create(vote_params)
    redirect_to vote.link.location
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
    params.permit(:link_id, :test)
  end
end
