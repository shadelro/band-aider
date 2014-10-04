class MembershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    membership = Membership.new(membership_params)
    authorize membership

    membership.save
    redirect_to band_path(membership_params[:band_id])
  end

  def destroy
    membership = Membership.find(params[:id])
    authorize membership

    if membership.destroy
      redirect_to current_user
    else
      redirect_to membership.band
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:band_id, :user_id)
  end
end
