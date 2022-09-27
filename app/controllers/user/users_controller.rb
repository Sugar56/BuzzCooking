class User::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @recipes_all = Recipe.where(user_id: params[:id])
    @recipes = @recipes_all.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "会員情報を編集しました"
    else
      render "edit"
    end
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    @recipes = Recipe.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :email, :address, :telephone_number, :name, :self_introduction, :is_deleted)
  end
end
