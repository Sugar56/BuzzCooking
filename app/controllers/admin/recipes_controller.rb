class Admin::RecipesController < ApplicationController
  def index
    @recipes = Recipe.page(params[:page])
  end

  def show
  end

  def check
  end
end
