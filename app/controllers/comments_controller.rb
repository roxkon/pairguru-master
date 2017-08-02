class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:create, :delete]
  
  def new
  	@comment = Comment.new(comments_params)
  	@comment.user_id = current_user.id
  	@comment.movie_id = @movie.id
  end

  def create
  	@movie = Movie.find(params[:movie_id])
  	@comment = @movie.comments.create(comments_params)
  	@comment.user_id = current_user.id
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
  	@comments = Comment.all
  end

  def edit  	
  end

  def update  	
  end

  private

  def set_movie
  	@movie = Movie.find(params[:movie_id])
  end

  def comments_params
    params.require(:comment).permit(:title, :body, :author, :user_id, :movie_id)
  end
end