class GifteesController < ApplicationController

  def show
    @giftee = Giftee.find(params[:id])
    @occasion = @giftee.occasion
    @present = Present.new
  end

  def new
    @occasion = Occasion.find(params[:occasion_id])
    @giftee = @occasion.giftees.build
  end

  def create
    @occasion = Occasion.find(params[:occasion_id])
    @giftee = @occasion.giftees.new(giftee_params)
    if @giftee.save
      flash[:notice] = "You have successfuly added a giftee!"
      redirect_to @occasion
    else
      flash[:error] = @giftee.errors
      render :new
    end
  end

  private

  def giftee_params
    params.require(:giftee).permit(:name, :user_id, :occasion_id, :present_id)
  end
end