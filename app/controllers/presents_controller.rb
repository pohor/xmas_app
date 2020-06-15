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

  def create
    @present = Present.new(present_params)
    if @present.save
      flash[:notice] = "You've added a new present!"
      redirect_to occasion_giftee_path(@present.giftee.occasion, @present.giftee)
    else
      @errors = @present.errors
      flash[:error] = @errors
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
      flash[:error] = @errors
      render :edit
    end
  end

  private

  def present_params
    params.require(:present).permit(:name, :link, :gifter_id, :giftee_id)
  end
end
