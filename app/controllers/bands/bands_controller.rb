module Bands
  class BandsController < ApplicationController
    before_filter :authenticate_user!, except: [:show, :index]

    def show
      @band = Band.find(params[:id])
      @my_membership = Membership.find_by(band: @band, user: current_user)
      @new_invitation = Invitation.new(band_id: @band.id)
      memberships = @band.memberships.map(&:user_id)
      invitations = @band.invitations.map(&:user_id)
      @users_to_invite = User.where.not(id: (memberships + invitations).flatten)
    end

    def index
      @bands = Band.all
    end

    def new
      @band = Band.new
      authorize @band
    end

    def create
      band = Band.new(band_params)
      authorize band

      if band.save
        Membership.create(band: band, user: current_user)
        flash[:notice] = 'Band created'
        redirect_to band
      else
        flash[:error] = 'Could not create band'
        redirect_to new_band_path
      end
    end

    def edit
      @band = Band.find(params[:id])
      authorize band
    end

    def update
      band = Band.find(params[:id])
      authorize band

      if band.update(band_params)
        flash[:notice] = 'Band updated'
        redirect_to band
      else
        flash[:error] = 'Could not update band'
        redirect_to edit_band_path(band)
      end
    end

    def destroy
      band = Band.find(params[:id])
      authorize band

      if band.destroy
        flash[:notice] = 'Band deleted'
        redirect_to current_user
      else
        flash[:error] = 'Could not delete band'
        redirect_to band
      end
    end

    private

    def band_params
      params.require(:band).permit(:name, :description)
    end
  end
end
