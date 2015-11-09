class LinksController < ApplicationController


  def index
    @links = Link.all.sort_by{|l| l.votes.sum(:value)}.reverse
  end

  def create
    @links = Link.all.sort_by{|l| l.votes.sum(:value)}.reverse
    @link = Link.new(link_params)
      unless @link.location[/\Ahttp:\/\//] || @link.location[/\Ahttps:\/\//]
      @link.location = "http://"+@link.location
    end
    if Link.all.any?{|l|l.location == @link.location}
      redirect_to existing_link_vote_path(link_id:Link.all.select{|l|l.location == @link.location}.first.id)
    else
      if @link.save
        render "index"
      else
        render "new"
      end
    end
  end

  def vote
    vote = Vote.new(vote_params)
    vote.value=-1 if params[:downvote]
    vote.save
    @links = Link.all.sort_by{|l| l.votes.sum(:value)}.reverse
    render "index"
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
    render "new"
  end

  def show
    @links = Link.all.sort_by{|l| l.votes.sum(:value)}.reverse
    @link = Link.find(params['id'])
  end

  def update
    @link = Link.find(params[:id])
    unless @link.location[/\Ahttp:\/\//] || @link.location[/\Ahttps:\/\//]
      @link.location = "http://"+@link.location
    end
    if @link.update(link_params)
      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:subcategory_id, :location, :title, :user_id)
  end

  def vote_params
    params.permit(:link_id)
  end
end
