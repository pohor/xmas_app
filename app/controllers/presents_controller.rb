class PresentsController < ApplicationController
  def index
    @presents = Present.all.where(user_id: current_user.id)
  end

  def show
    @present = Present.find(params[:id])
  end

  def new
    @present = Present.new
  end

  def create
    @present = Present.new(present_params)
    if @present.save
      flash[:notice] = "You've added an present!"
      redirect_to @present
    else
      @errors = @present.errors
      flash[:error] = @errors
      render :new
    end
  end

  def edit
    @present = Present.find(params[:id])
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
    params.require(:present).permit(:name, :date, :user_id, :gifter_id, :giftee_id)
  end
end
