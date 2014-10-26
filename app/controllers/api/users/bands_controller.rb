module Api
  module Users
    class BandsController < ApiController
      def index
        @bands = User.find(params[:user_id]).bands
      end
    end
  end
end
