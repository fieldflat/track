class RecipesController < ApplicationController

  # POST /recipes -> レシピを作成
  def index
    @recipes = Recipe.all
    render json: { recipes: @recipes.select(:id, :title, :making_time, :serves, :ingredients, :cost) }
  end

  # GET /recipes -> 全レシピ一覧を返す
  def show
    @recipe = Recipe.find(params[:id])
    render json: { message: "Recipe details by id", recipe: {title: @recipe.title, making_time: @recipe.making_time, serves: @recipe.serves, ingredients: @recipe.ingredients, cost: @recipe.cost} }
  end

  # GET /recipes/{id} -> 指定レシピ一つを返す
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: { message: 'Recipe successfully created!', recipe: {title: @recipe.title, making_time: @recipe.making_time, serves: @recipe.serves, ingredients: @recipe.ingredients, cost: @recipe.cost} }
    else
      render json: { message: 'Recipe creation failed!', required: "title, making_time, serves, ingredients, cost" }
    end
  end

  # PATCH /recipes/{id} -> 指定レシピを更新
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      render json: { message: "Recipe successfully updated!", recipe: {title: @recipe.title, making_time: @recipe.making_time, serves: @recipe.serves, ingredients: @recipe.ingredients, cost: @recipe.cost} }
    else
      render json: { message: "Recipe updating failed" }
    end
  end

  # DELETE /recipes/{id} -> 指定レシピの削除
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

  def recipe_params
    params.permit(:title, :making_time, :serves, :ingredients, :cost)
  end

end
