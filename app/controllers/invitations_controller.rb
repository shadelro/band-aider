class InvitationsController < ApplicationController
  def show
    @invitation = Invitation.find(params[:id])
  end

  def destroy
    Invitation.find(params[:id]).destroy

    redirect_to current_user
  end
end
