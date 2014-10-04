class InvitationsController < ApplicationController
  def show
    @invitation = Invitation.find(params[:id])
    authorize @invitation
  end

  def destroy
    invitation = Invitation.find(params[:id])
    authorize invitation

    if invitation.destroy
      redirect_to current_user
    else
      redirect_to invitation
    end
  end
end
