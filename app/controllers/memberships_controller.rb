class MembershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    membership = Membership.new(membership_params)
    authorize membership

    if membership.save
      flash[:notice] = "You've been added to the band"
      redirect_to membership.band
    else
      flash[:error] = 'An error occurred trying to add you to the band'
      redirect_to band_path(membership_params[:band_id])
    end
  end

  def edit
    @membership = Membership.find(params[:id])
    authorize @membership
  end

  def update
    membership = Membership.find(params[:id])
    authorize membership

    if membership.update(membership_params)
      flash[:notice] = 'Details updated'
      redirect_to band_user_path(band_id: membership.band_id, id: membership.user_id)
    else
      flash[:error] = 'Could not update details'
      redirect_to edit_membership_path(membership)
    end
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
    params.require(:membership).permit(:band_id, :user_id, :instrument, :bio)
  end
end
