class InvitationsController < ApplicationController
  def show
    @invitation = Invitation.find(params[:id])
    authorize @invitation
  end

  def destroy
    invitation = Invitation.find(params[:id])
    authorize invitation

    if invitation.destroy
      flash[:notice] = 'Invitation turned down'
      redirect_to current_user
    else
      flash[:error] = "An error occurred; you're still invited"
      redirect_to invitation
    end
  end
end
