class User::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @recipes = Recipe.order('id DESC').limit(4)
  end

  def about
  end
end
