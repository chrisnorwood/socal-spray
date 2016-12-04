class ApplicationController < ActionController::API

  def preflight
    render nothing: true
  end
end
