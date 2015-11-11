class SubcategoriesController < ApplicationController
  require 'will_paginate/array'

  def index

  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    @subcategory.user = current_user
    if @subcategory.save
      @links = Link.where(subcategory:@subcategory).select("links.*, SUM(votes.value) AS vote_count").order("vote_count DESC").joins(:votes).group("links.id").paginate(:page => params[:page], :per_page => 10)
      redirect_to subcategories_path
    else
      render "new"
    end
  end

  def vote
    Vote.create(vote_params)
    @subcategory = Subcategory.all.select{|s| s.name.downcase==params['name'].downcase}.first
    redirect_to subcategory_path(id:@subcategory.id)
  end

  def new
    @subcategory = Subcategory.new
  end

  def edit
    sub =Subcategory.all.select{|s| s.name.downcase==params['name'].downcase}.first
    render "links/index"
  end

  def show
    @subcategory =Subcategory.all.select{|s| s.name.downcase==params['name'].downcase}.first
    @links = Link.where(subcategory:@subcategory).select("links.*, SUM(votes.value) AS vote_count").order("vote_count DESC").joins(:votes).group("links.id").paginate(:page => params[:page], :per_page => 10)
  end

  def update
    @subcategory = Subcategory.find(params['id'])
    if @subcategory.update(subcategory_params)
      @links = Link.where(subcategory:@subcategory).select("links.*, SUM(votes.value) AS vote_count").order("vote_count DESC").joins(:votes).group("links.id").paginate(:page => params[:page], :per_page => 10)
      redirect_to subcategory_path(name:@subcategory.name)
    else
      render "new"
    end
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name)
  end

  def vote_params
    params.permit(:link_id, :test,:value)
  end
end
