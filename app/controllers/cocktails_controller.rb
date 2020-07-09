class CocktailsController < ApplicationController
  before_action :find_cocktail, only:[:show]

  def home
    @cocktails = Cocktail.all
    @cocktails_average_rate = cocktails_average(@cocktails)
  end

  def index
    if params[:search].present?
      @query = params[:search]
      @cocktails = Cocktail.where("cocktails.name ILIKE ?", "%#{params[:search]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @rates = @cocktail.ratings
    @rating = Rating.new
    @doses = @cocktail.doses
    @num = cal_average_rates(@rates)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :cocktail_photo)
  end

  def cal_average_rates(rates)
    num = 0
    if rates.empty?
      return num
    else
      rates.each do |rate|
        num = num.to_f + rate.rate.to_f
      end
      return num / rates.length
    end
  end

  def cocktails_average(cocktails)
    cocktails_array = []
    cocktails.each do |cocktail|
      cocktail_hash = {}
      cocktail_hash[:id] = cocktail.id
      cocktail_hash[:rate] = cal_average_rates(cocktail.ratings)
      cocktails_array << cocktail_hash
    end
    return cocktails_array
  end
end
