class TagsController < ApplicationController

  def index

  end

  def show
    @tag =Tag.find(params['id'])
    # @links = Link.where(tag:@tag).select("links.*, SUM(votes.value) AS vote_count").order("vote_count DESC").joins(:votes).group("links.id").paginate(:page => params[:page], :per_page => 10)
    @links = Link.all.select{|l| l.tags.include?(@tag)}.paginate(:page => params[:page], :per_page => 10)
  end
end
