class MembershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    membership = Membership.new(band_id: params[:band_id], user_id: current_user.id)

    if membership.save
      redirect_to band_path(id: params[:band_id])
    else
      redirect_to user_invitation_path(current_user, invitation)
    end
  end
end
