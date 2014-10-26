module Api
  class ApiController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

    doorkeeper_for :all

    protected

    def current_user
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    def user_not_authorized
      render json: {error: 'you are not authorized to perform that action'}.to_json, status: 401
    end

    def resource_not_found
      render json: {error: 'resource not found'}.to_json, status: 404
    end
  end
end
