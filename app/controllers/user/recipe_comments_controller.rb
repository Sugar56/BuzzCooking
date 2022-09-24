class User::RecipeCommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = RecipeComment.new(recipe_comment_params)
    comment.user_id = current_user.id
    comment.recipe_id = recipe.id
    comment.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    RecipeComment.find(params[:id]).destroy
    if current_admin.present?
      redirect_to admin_recipe_path(params[:recipe_id])
    else
      redirect_to recipe_path(params[:recipe_id])
    end
  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment)
  end
end
