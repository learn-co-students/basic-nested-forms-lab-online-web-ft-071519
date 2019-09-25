require 'pry'

class RecipesController < ApplicationController
  def show

    @recipe = Recipe.find(params[:id])
        

  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build()
    @recipe.ingredients.build()
    # @person.addresses.build(address_type: 'work')
    # @person.addresses.build(address_type: 'home')
  end

  def create
      recipe = Recipe.create(recipe_params)
       
    redirect_to recipe
  end
 
 private
def recipe_params
  params.require(:recipe).permit(
    :title,
    ingredients_attributes: [
      :id,
      :name,
      :quantity
    ]
  )
end

end


