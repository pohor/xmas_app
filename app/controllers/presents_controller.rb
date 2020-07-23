class PresentsController < ApplicationController
  def user_index
    @presents = Present.where(giftee: Giftee.where(user_is_present: true).where(user_id: current_user.id))
    render "presents/user_index"
  end

  def index
    @presents = Giftee.find(params[:id]).presents
  end

  def show
    @present = Present.find(params[:id])
  end

  def destroy
    @present = Present.find(params[:id])
    giftee = @present.giftee
    @present.destroy
    redirect_to presents_path(giftee.id)
  end

  def create
    @present = Present.new(present_params)
    if @present.save
      flash[:notice] = "You've added a new present!"
      redirect_to occasion_giftee_path(@present.giftee.occasion, @present.giftee)
    else
      @errors = @present.errors
      flash[:alert] = @errors
      render :new
    end
  end

  def edit
    @present = Present.find(params[:id])
    @giftee = @present.giftee
  end

  def update
    @present = Present.find(params[:id])
    if @present.update(present_params)
      flash[:notice] = "You've successfully updated the Present"
      redirect_to @present
    else
      @errors = @present.errors
      flash[:alert] = @errors
      render :edit
    end
  end

  def assign_gifter_to_present
    present = Present.find(params[:id])
    gifter = present.giftee.gifter

    present.gifter_id = gifter.id
    flash[:notice] = "You've reserved the gift to buy for #{present.giftee.name}" if present.save
    redirect_to occasion_giftee_path(present.giftee.occasion, present.giftee)
  end

  def remove_gifter_from_present
    present = Present.find(params[:id])
    present.gifter_id = nil
    flash[:notice] = "You've removed the gift from gifts you'll buy for #{present.giftee.name}" if present.save
    redirect_to occasion_giftee_path(present.giftee.occasion, present.giftee)
  end

  def validate
    present = Present.new(validate_params)
    present.valid?
    present_field = validate_params.keys.first.try(:to_sym)
    validation_response = !present.errors.include?(present_field)
    respond_to do |format|
      format.json { render json: {field_name: present_field, valid: validation_response, message: present.errors[present_field]} }
    end
  end

  private

  def present_params
    params.require(:present).permit(:name, :link, :gifter_id, :giftee_id)
  end

  def validate_params
    params.require(:present).permit(:name, :link)
  end
end
