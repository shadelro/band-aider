class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @invitation = Invitation.find(params[:id])
    authorize @invitation

    @new_membership = Membership.new(band_id: @invitation.band.id, user_id: @invitation.user.id)
  end

  def create
    invitation = Invitation.new(invitation_params)
    authorize invitation

    if invitation.save
      UserMailer.band_invitation_email(invitation).deliver
      flash[:notice] = 'User invited'
    else
      flash[:error] = 'Could not invite user'
    end

    redirect_to invitation.band
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

  private

  def invitation_params
    params.require(:invitation).permit(:band_id, :user_id)
  end
end
