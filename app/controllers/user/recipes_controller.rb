class User::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
    @cooking_methods = @recipe.cooking_methods.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render 'new'
    end
  end

  def index
    @genres = Genre.all
    @recipes = Recipe.page(params[:page])
  end

  def show
    @genres = Genre.all
    @recipe = Recipe.find(params[:id])
    @user = User.find(params[:id])
    @recipe_comment = RecipeComment.new
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
    params.require(:recipe).permit(:name, :image, :recipe_explanation, :point_explanation,
                                  ingredients_attributes:[:name, :amount, :_destroy],
                                  cooking_methods_attributes:[:cooking_explanation, :image, :step, :_destroy])
  end
end
