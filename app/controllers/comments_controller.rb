class CommentsController < ApplicationController
  
  def new  	
  end

  def create
  	@user = current_user
  	@movie = Movie.find(params[:movie_id])
  	@comment = @user.comments.create(permit_params)
  	@comment.movie_id = @movie.id

  	if @comment.save
  		redirect_to @movie
  		flash.now[:succes] = "hurra"
  	else
  		redirect_to @movie
  		flash.now[:error] = "error"
  	end
  end

  def index  	
  end

  def edit  	
  end

  def update  	
  end

  private

  def permit_params  	
  end
end
