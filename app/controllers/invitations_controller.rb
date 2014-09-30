class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @invitations = Invitation.where(user_id: params[:user_id])
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def destroy
    Invitation.find(params[:id]).destroy

    redirect_to current_user
  end
end
