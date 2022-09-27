class User::RecipesController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
    @cooking_methods = @recipe.cooking_methods.build
    @genres = Genre.all.map { |g| [g.name, g.id] }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @genres = Genre.all.map { |g| [g.name, g.id] }
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render 'new'
    end
  end

  def index
    @genres = Genre.all
    @user = current_user
    @recipes = params[:name].present? ? Tag.find(params[:name]).recipes.page(params[:page]) : Recipe.page(params[:page])
  end

  def show
    @genres = Genre.all
    @recipe = Recipe.find(params[:id])
    @user = current_user
    @ingredients = @recipe.ingredients
    @cooking_methods = @recipe.cooking_methods
    @recipe_comment = RecipeComment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all.map { |g| [g.name, g.id] }
  end

  def update
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all.map { |g| [g.name, g.id] }
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "レシピ情報を編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(current_user.id)
  end

  def search
    if params[:keyword].present?
      @recipes = Recipe.joins(:tags, :genre, :user).where("recipes.name LIKE ? OR tags.name LIKE ? OR genres.name LIKE ? OR users.name LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%").distinct.page(params[:page])
      @keyword = params[:keyword]
      @genres = Genre.all
      @user = current_user
    else
      @genres = Genre.all
      @user = current_user
      @recipes = Recipe.page(params[:page])
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :serving, :genre_id, :recipe_explanation, :point_explanation,
                                  tag_ids:[],
                                  ingredients_attributes:[:id, :name, :amount, :_destroy],
                                  cooking_methods_attributes:[:id, :cooking_explanation, :image, :step, :_destroy])
  end
end
