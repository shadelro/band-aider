class MembershipsController < ApplicationController
  def create
    membership = Membership.create(membership_params)

    redirect_to band_path(membership.band)
  end

  private

  def membership_params
    params.require(:membership).permit(:band_id, :user_id)
  end
end
