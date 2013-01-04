class AuthorsController < ApplicationController
 before_filter :signed_in_user

  def create
	@author = current_user.authors.build(params[:author])
    if @author.save
      flash[:success] = "Author created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
end

