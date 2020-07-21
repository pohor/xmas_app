class GiftersController < ApplicationController
  after_action :create_giftee, only: [:create]

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
      redirect_to @occasion
    else
      flash[:error] = @gifter.errors
      render :new
    end
  end

  def validate
    gifter = Gifter.new(validate_params)
    gifter.valid?
    gifter_field = validate_params.keys.first.try(:to_sym)
    validation_response = !gifter.errors.include?(gifter_field)
    respond_to do |format|
      format.json { render json: {field_name: gifter_field, valid: validation_response, message: gifter.errors[gifter_field]} }
    end
  end

  private

  def gifter_params
    params.require(:gifter).permit(:name, :user_id, :occasion_id, :present_id)
  end

  def validate_params
    params.require(:gifter).permit(:name)
  end

  def create_giftee
    occasion = Occasion.find(params[:occasion_id])
    occasion.giftees.create(name: params[:gifter][:name], user: current_user, user_is_present: true)
  end
end