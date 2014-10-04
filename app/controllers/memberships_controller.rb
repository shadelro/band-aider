class MembershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    membership = Membership.new(membership_params)
    authorize membership

    if membership.save
      flash[:notice] = "You've been added to the band"
    else
      flash[:error] = "An error occurred trying to add you to the band"
    end

    redirect_to band_path(membership_params[:band_id])
  end

  def destroy
    membership = Membership.find(params[:id])
    authorize membership

    if membership.destroy
      flash[:notice] = 'You have left the band'
      redirect_to current_user
    else
      flash[:error] = "An error occurred; you're still in the band"
      redirect_to membership.band
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:band_id, :user_id)
  end
end
