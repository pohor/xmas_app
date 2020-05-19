class OccasionsController < ApplicationController
 def new
   @occasion = Occasion.new
 end

  def create
    @occasion = Occasion.new(occasion_params)
    if @occasion.save
      flash[:message] = "You've added an occasion!"
      redirect_to @occasion
    else
      @errors = @occasion.errors
      flash[:error] = @errors
      render :new
    end
  end

 def show
   @occasion = Occasion.find(params[:id])
 end

  private

  def occasion_params
    params.require(:occasion).permit(:name, :date)
  end
end