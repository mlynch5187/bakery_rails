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
      flash[:notice] = "Please fill out all fields and give the ingredient a unique name"
      redirect_to "/pies/ingredients/new"
    end
  end

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update(ingredient_params)
    if ingredient.save
      redirect_to "/pies/ingredients/#{ingredient.id}"
    else
      flash[:notice] = "Please fill out all fields and give the ingredient a unique name"
      redirect_to "/pies/ingredients/#{ingredient.id}/edit"
    end
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    ingredient.destroy
    redirect_to "/pies/ingredients"
  end

  private

  def ingredient_params
    params.permit(:name, :kind)
  end
end
