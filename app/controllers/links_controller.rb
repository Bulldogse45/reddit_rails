class LinksController < ApplicationController


  def index
    @links = Link.all.sort_by{|l| l.votes.count}.reverse
  end
  def create
    @link = Link.new(link_params)
      unless @link.location[/\Ahttp:\/\//] || @link.location[/\Ahttps:\/\//]
      @link.location = "http://"+@link.location
    end
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
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:location, :title)
  end
end
