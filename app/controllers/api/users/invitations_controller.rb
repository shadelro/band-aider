module Api
  module Users
    class InvitationsController < ApiController
      def index
        @invitations = Invitation.where(user_id: params[:user_id])
      end
    end
  end
end
