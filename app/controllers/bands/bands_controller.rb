module Bands
  class BandsController < ApplicationController
    def index
      @bands = Band.all
    end

    def show
      @band = Band.find(params[:id])
      @my_membership = Membership.find_by(band: @band, user: current_user)
      @new_invitation = Invitation.new(band_id: @band.id)
      memberships = @band.memberships.map(&:user_id)
      invitations = @band.invitations.map(&:user_id)
      @users_to_invite = User.where.not(id: (memberships + invitations).flatten)
    end
  end
end
