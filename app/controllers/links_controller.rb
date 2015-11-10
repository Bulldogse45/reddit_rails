class LinksController < ApplicationController

  require 'will_paginate/array'

  def index
    @links = Link.all.sort_by{|l| l.votes.sum(:value)}.reverse.paginate(:page => params[:page], :per_page => 10)
    #@links = Link.paginate(:page => params[:page], :per_page => 10).sort_by{|l| l.votes.sum(:value)}.reverse

  end

  def create
    @link = Link.new(link_params)
      @link.user = current_user
      unless @link.location[/\Ahttp:\/\//] || @link.location[/\Ahttps:\/\//]
      @link.location = "http://"+@link.location
    end
    if Link.all.any?{|l|l.location == @link.location}
      redirect_to existing_link_vote_path(link_id:Link.all.select{|l|l.location == @link.location}.first.id)
    else
      if @link.save
        redirect_to root_path
      else
        render "new"
      end
    end
  end

  def vote
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    @vote.value=-1 if params[:downvote]
    @vote.save
    redirect_to :back
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
    render "new"
  end

  def show
    @link = Link.find(params['id'])
    @links = Link.all.select{|l| l.id == @link.id}

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
    params.require(:link).permit(:subcategory_id, :location, :title)
  end

  def vote_params
    params.permit(:link_id)
  end
end
