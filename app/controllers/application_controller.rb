class ApplicationController < ActionController::API
  before_action :force_json

  def force_json
     request.format = :json
  end
end
