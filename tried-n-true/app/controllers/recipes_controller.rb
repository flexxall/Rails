class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :require_user_logged_in!, except: [:index, :show]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = session[:user_id]
    respond_to do |format|
      if @recipe.save
        format.html do
          redirect_to recipe_url(@recipe), notice: "Recipe was successfully created."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html do
          redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html do
        redirect_to recipes_url, notice: "Recipe was successfully destroyed."
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:user_id, :title, :description, :directions)
  end
end