module Api
  module Users
    class UsersController < ApiController
      def show
        @user = User.find(params[:id])
      end
    end
  end
end
