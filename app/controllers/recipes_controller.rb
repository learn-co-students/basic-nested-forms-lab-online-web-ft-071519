class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    #binding.pry
    @new_recipe = Recipe.new(recipe_params)

    # recipe_params["ingredients_attributes"].each do |i|
    #   @new_ing = @new_recipe.ingredients.build(name: i["name"], quantity: i["quantity"])
    #   @new_ing.save
    # end

    if @new_recipe.save
      redirect_to recipe_path(@new_recipe)
    else
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :ingredients_attributes => [
      "0",
      "1"
    ])
  end
end
