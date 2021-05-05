class Pies::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find (params[:id])
  end

  def new; end
end
