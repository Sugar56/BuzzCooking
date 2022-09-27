class User::RecipeCommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    comment = RecipeComment.new(recipe_comment_params)
    comment.user_id = current_user.id
    comment.recipe_id = @recipe.id
    comment.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    RecipeComment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    render 'user/recipe_comments/destroy'
  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment)
  end
end
