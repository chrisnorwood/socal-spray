class ClimbsController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:area_id]
      area = Area.friendly.find(params[:area_id])
      climbs = area.climbs
      render json: climbs
    end
  end

  def show
    climb = Climb.find(params[:id])
    render json: climb
  end
end