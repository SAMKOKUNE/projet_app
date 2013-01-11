class PublicationsController < ApplicationController
 
  before_filter :signed_in_user, only: [:index,:create,:new]

  def index
      @publications = Publication.all
      
  end
  def new
    @publication = Publication.new
  end
  def create
    @publication = Publication.new(params[:publication])
    if @publication.save
       redirect_to publications_path
    else
      render 'new'
    end
  end
end
