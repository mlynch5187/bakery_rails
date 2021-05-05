class Pies::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find (params[:id])
  end

  def new; end

  def create
    ingredient = Ingredient.create(ingredient_params)
    if ingredient.save
      redirect_to "/pies/ingredients"
    else
      flash[:error] = ingredient.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def ingredient_params
    params.permit(:name, :kind)
  end
end
