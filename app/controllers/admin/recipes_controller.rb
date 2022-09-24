class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @recipes = Recipe.page(params[:page])
  end

  def show
    @genres = Genre.all
    @recipe = Recipe.find(params[:id])
    @user = User.find(params[:id])
    @ingredients = @recipe.ingredients
    @cooking_methods = @recipe.cooking_methods
    @recipe_comment = RecipeComment.new
  end

  def check
  end
end
