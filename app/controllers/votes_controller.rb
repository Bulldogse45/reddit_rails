class VotesController < ApplicationController

  def index
    redirect_to root_path
  end
  def create
    vote = Vote.create(vote_params)
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
  end

  private

  def vote_params
    params.permit(:link_id)
  end
end
