class RatingsController < ApplicationController
  before_action :find_rate, only:[:show]
  before_action :find_cocktail, only:[:create]

  def show
  end

  def new
    @rate = Rating.new
  end

  def create
    @rate = Rating.new(rate_params)
    @rate.cocktail = @cocktail
    if @rate.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  private

  def find_rate
    @rate = Rating.find(params[:id])
  end

  def rate_params
    params.require(:rating).permit(:rate, :description)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
