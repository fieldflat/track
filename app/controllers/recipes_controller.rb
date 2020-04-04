class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render json: { recipes: @recipes }
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: { message: @recipe, recipe: @recipe }
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      render json: { message: 'Recipe successfully created!', recipe: recipe }
    else
      render json: { message: 'Recipe creation failed!', required: "title, making_time, serves, ingredients, cost" }
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @post.update(recipe_params)
          render json: { status: 'SUCCESS', message: 'Updated the post', data: @post }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors }
        end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe
      @recipe.destroy
      render json: { message: 'Recipe successfully removed!' }
    else
      render json: { message: 'No Recipe found' }
    end
  end

  private

  def post_params
    params.require(:recipe).permit(:title, :making_time, :serves, :ingredients, :cost)
  end

end
