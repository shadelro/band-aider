module Users
  class InvitationsController < ApplicationController
    def index
      @invitations = Invitation.where(user_id: params[:user_id])
    end
  end
end
