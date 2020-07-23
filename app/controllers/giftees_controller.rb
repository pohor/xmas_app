class GifteesController < ApplicationController
  def index
    @gifters = current_user.gifters
    @occasions = Occasion.where(gifters: @gifters)
  end

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
      flash[:alert] = @giftee.errors
      render :new
    end
  end

  def validate
    giftee = Giftee.new(validate_params)
    giftee.valid?
    giftee_field = validate_params.keys.first.try(:to_sym)
    validation_response = !giftee.errors.include?(giftee_field)
    respond_to do |format|
      format.json { render json: {field_name: giftee_field, valid: validation_response, message: giftee.errors[giftee_field]} }
    end
  end

  private

  def giftee_params
    params.require(:giftee).permit(:name, :user_id, :occasion_id, :present_id)
  end

  def validate_params
    params.require(:giftee).permit(:name)
  end
end