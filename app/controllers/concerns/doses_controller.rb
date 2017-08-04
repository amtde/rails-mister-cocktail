class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
     @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def review_params
    params.require(:dose).permit(:description, :ingredient, :cocktail)
  end
end
