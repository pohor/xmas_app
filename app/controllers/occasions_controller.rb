class OccasionsController < ApplicationController

  def index
    @occasions = Occasion.all
  end

  def show
    @occasion = Occasion.find(params[:id])
  end

  def new
    @occasion = Occasion.new
  end

  def create
    @occasion = Occasion.new(occasion_params)
    if @occasion.save
      flash[:notice] = "You've added an occasion!"
      redirect_to @occasion
    else
      @errors = @occasion.errors
      flash[:error] = @errors
      render :new
    end
  end

  def edit
    @occasion = Occasion.find(params[:id])
  end

  def update
    @occasion = Occasion.find(params[:id])
    if @occasion.update(occasion_params)
      flash[:notice] = "You've successfully updated the Occasion"
      redirect_to @occasion
    else
      @errors = @occasion.errors
      flash[:error] = @errors
      render :edit
    end
  end

  def drawing
    occasion = Occasion.find(params[:id])
    if occasion.draw_lots
      flash[:notice] = "The drawing has been done!"
    else
      flash[:alert] = "Drawing lots is unnecessary now!"
    end
    redirect_to occasion
  end

  private

  def occasion_params
    params.require(:occasion).permit(:name, :date)
  end
end