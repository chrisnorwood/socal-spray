class ApplicationController < ActionController::API
  include Knock::Authenticable

  def preflight
    render nothing: true
  end
end
