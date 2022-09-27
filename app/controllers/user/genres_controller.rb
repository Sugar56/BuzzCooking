class User::GenresController < ApplicationController
  before_action :authenticate_user!
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @user = current_user
    @recipes = Recipe.page(params[:page])
  end
end
