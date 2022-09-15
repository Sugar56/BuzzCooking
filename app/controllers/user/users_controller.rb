class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page])
    @recipes_all = @user.recipes.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def check
  end
end
