class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @invitation = Invitation.find(params[:id])
  end

  def destroy
    Invitation.find(params[:id]).destroy

    redirect_to current_user
  end
end
