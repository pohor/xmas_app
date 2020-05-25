class GiftersController < ApplicationController
  after_action :create_giftee, only: [:create]

  def show
    @gifter = Gifter.find(params[:id])
    @occasion = @gifter.occasion
  end

  def new
    @occasion = Occasion.find(params[:occasion_id])
    @gifter = @occasion.gifters.build
  end

  def create
    @occasion = Occasion.find(params[:occasion_id])
    @gifter = @occasion.gifters.new(gifter_params)
    @gifter.user = current_user

    if @gifter.save
      flash[:notice] = "You have successfuly added yourself as a participant!"
      redirect_to [@occasion, @gifter]
    else
      flash[:error] = @gifter.errors
      render :new
    end
  end

  private

  def gifter_params
    params.require(:gifter).permit(:name, :user_id, :occasion_id, :present_id)
  end

  def create_giftee
    occasion = Occasion.find(params[:occasion_id])
    occasion.giftees.create(name: params[:gifter][:name], user: current_user)
  end
end