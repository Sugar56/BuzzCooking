class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: "会員情報を編集しました"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :address, :telephone_number, :name, :self_introduction, :is_deleted)
  end
end
