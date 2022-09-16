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
    @genres = Genre.all
    @recipes = Recipe.page(params[:page])
  end

  def show
  end

  def edit
  end

  def check
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :recipe_explanation, :point_explanation)
  end
end
