class ValidationsController < ApplicationController
  def validate_link
    params[:link]
    render json: { message: "ERROR"}
  end
end