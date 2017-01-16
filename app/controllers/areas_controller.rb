class AreasController < ApplicationController
  before_action :authenticate_user

  def index
    areas = Area.first.children
    render json: areas
  end

  def show
    area = Area.find(params[:id])
    render json: area, include: 'children'
  end
end