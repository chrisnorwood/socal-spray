class ClimbsController < ApplicationController
  before_action :authenticate_user

  def show
    climb = Climb.find(params[:id])
    render json: climb
  end
end