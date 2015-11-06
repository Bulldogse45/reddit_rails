class LinksController < ApplicationController


  def index
    @links = Link.all.sort_by{|l| l.votes.count}.reverse
  end
  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      render "new"
    end
  end
  def new
    @link = Link.new
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

  def link_params
    params.permit(:link_id)
  end
end
