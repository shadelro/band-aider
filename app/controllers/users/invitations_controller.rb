module Users
  class InvitationsController < ApplicationController
    before_filter :authenticate_user!

    def index
      @invitations = Invitation.where(user_id: params[:user_id])
    end
  end
end
