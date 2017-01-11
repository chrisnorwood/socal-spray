class PuzzlesController < ApplicationController
  before_action :authenticate_user

  def index
    @puzzles = Puzzle.all
    render json: @puzzles
  end
end