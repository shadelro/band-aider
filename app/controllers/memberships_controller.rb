class MembershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    membership = Membership.new(membership_params)
    authorize membership

    if membership.save
      @membership = Membership.find(membership.id)
      respond_to do |format|
        format.html {
          flash[:notice] = "You've been added to the band"
          redirect_to @membership.band
        }
        format.json { }
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = "An error occurred trying to add you to the band"
          redirect_to band_path(membership_params[:band_id])
        }
        format.json { render json: {errors: membership.errors.full_messages}.to_json, status: 400 }
      end
    end
  end

  def edit
    @membership = Membership.find(params[:id])
    authorize @membership
  end

  def update
    @membership = Membership.find(params[:id])
    authorize membership

    if @membership.update(membership_params)
      respond_to do |format|
        format.html {
          flash[:notice] = 'Details updated'
          redirect_to band_user_path(band_id: @membership.band_id, id: @membership.user_id)
        }
        format.json { }
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = 'Could not update details'
          redirect_to edit_membership_path(@membership)
        }
        format.json { render json: {errors: @membership.errors.full_messages}.to_json, status: 400 }
      end
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    authorize membership

    if membership.destroy
      respond_to do |format|
        format.html {
          flash[:notice] = 'You have left the band'
          redirect_to current_user
        }
        format.json { render nothing: true, status: 204 }
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = "An error occurred; you're still in the band"
          redirect_to membership.band
        }
        format.json { render json: {errors: membership.errors.full_messages}.to_json, status: 400 }
      end
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:band_id, :user_id, :instrument, :bio)
  end
end
