class User::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe.id)
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :recipe_explanation, :point_explanation)
  end
end
