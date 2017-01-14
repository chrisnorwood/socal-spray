class AreasController < ApplicationController
  before_action :authenticate_user

  def index
    areas = Area.first.children
    render json: areas
  end
end