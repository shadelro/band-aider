class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  skip_before_action :verify_authenticity_token, if: :json_request?

  protected

  def json_request?
    request.format.json?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private

  def user_not_authorized
    respond_to do |format|
      format.html {
        flash[:error] = 'You are not authorized to perform this action.'
        redirect_to(root_path)
      }
      format.json {
        render json: {error: 'You are not authorized to perform this action'}.to_json, status: 401
      }
    end
  end
end
