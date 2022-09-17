class Admin::RecipesController < ApplicationController
  def index
    @recipes = Recipe.page(params[:page])
    @genre = Genre.find(params[:id])
  end

  def show
  end

  def check
  end
end
