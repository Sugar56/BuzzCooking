class User::RecipesController < ApplicationController
  def new
  end

  def index
    @recipes = Recipe.page(params[:page])
  end

  def show
  end

  def edit
  end

  def check
  end
end
