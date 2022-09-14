class User::HomesController < ApplicationController
  def top
    @recipes = Recipe.order('id DESC').limit(4)
  end

  def about
  end
end
