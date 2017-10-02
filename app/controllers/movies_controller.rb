class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit([:title, :director, :genre])
  end

  def index
    movie = Movie.all
    render :json => movie
  end

  def show
    movie = Movie.find(params[:id])
    render :json => movie
  end

  def create
    movie = Movie.create(movie_params)
    render :json => movie
  end

  def update
    movie = Movie.find(params[:id])

    if movie.update_attributes(movie_params)
      render :json => movie
    else
      render :json => {status: :update_failed}
    end
  end

  def destroy
    movie = Movie.find(params[:id])

    if movie.destroy!
      render :json => {status: :success}
    else
      render :json => {status: :delete_failed}
    end
  end

end
