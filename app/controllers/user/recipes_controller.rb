class User::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
    @cooking_methods = @recipe.cooking_methods.build
    # @genres = Genre.all.map { |g| g.name }
    @genres = Genre.all.map { |g| [g.name, g.id] }
    # @genres = Genre.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.user_id = current_user.id
    #byebug
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render 'new'
    end
  end

  def index
    @genres = Genre.all
    @recipes = Recipe.page(params[:page])
    if params[:search] == nil || ''
      @recipe_all = Recipe.all
    elsif params[:search] == ''
      @recipes_all = Recipe.all
    else
      #部分検索
      @Recipes_all = Recipes.where("body LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def show
    @genres = Genre.all
    @recipe = Recipe.find(params[:id])
    #@user = User.find(params[:id])
    @user = current_user
    @ingredients = @recipe.ingredients
    @cooking_methods = @recipe.cooking_methods
    @recipe_comment = RecipeComment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
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
    params.require(:recipe).permit(:name, :image, :serving, :genre_id, :recipe_explanation, :point_explanation,
                                  ingredients_attributes:[:name, :amount, :_destroy],
                                  cooking_methods_attributes:[:cooking_explanation, :image, :step, :_destroy])
  end
end
