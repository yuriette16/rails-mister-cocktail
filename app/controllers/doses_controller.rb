class DosesController < ApplicationController
  # before_action :find_dose, only:[:new, :show]
  before_action :find_cocktail, only:[:new, :create, :destroy, :show]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
