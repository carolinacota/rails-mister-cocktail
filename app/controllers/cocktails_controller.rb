class CocktailsController < ApplicationController
  def home; end

  def index
    all_cocktails
    if params[:query].present?
      @cocktail = Cocktail.where(name: params[:query]).first
      redirect_to cocktail_path(@cocktail)
    else
      all_cocktails
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def all_cocktails
    @cocktails = Cocktail.all
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
