class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = Recipe.page(params[:page])
    @recipes_all = Recipe.all
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

  def check
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    @recipes = Recipe.find(favorites)
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行致しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :email, :address, :telephone_number, :name, :self_introduction, :is_deleted)
  end
end
